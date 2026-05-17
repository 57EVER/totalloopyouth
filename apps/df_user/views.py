from random import Random
from django.shortcuts import render, redirect, HttpResponseRedirect, reverse
from django.core.paginator import Paginator
from django.http import JsonResponse
from hashlib import sha1
from django.contrib import messages
from ..df_goods.models import TypeInfo,GoodsContent
from ..df_cart.models import CartInfo
from .models import GoodsBrowser,Information
from . import user_decorator
from ..df_order.models import *
from django.core.mail import send_mail

def register(request):
    context = {
        'title': '用户注册',
    }
    return render(request, 'df_user/register.html', context)
def register_handle(request):
    username = request.POST.get('user_name')
    password = request.POST.get('pwd')
    confirm_pwd = request.POST.get('confirm_pwd')
    email = request.POST.get('email')

    # 判断两次密码一致性
    if password != confirm_pwd:
        return redirect('/user/register/')
    # 密码加密
    s1 = sha1()
    s1.update(password.encode('utf8'))
    encrypted_pwd = s1.hexdigest()

    # 创建对象
    UserInfo.objects.create(uname=username, upwd=encrypted_pwd, uemail=email)
    # 注册成功
    context = {
        'title': '用户登陆',
        'username': username,
    }
    return render(request, 'df_user/login.html', context)


def register_exist(request):
    username = request.GET.get('uname')
    uemail = request.GET.get('uemail')
    count = UserInfo.objects.filter(uname=username).count()
    email_count=UserInfo.objects.filter(uemail=uemail).count()
    print(email_count)
    return JsonResponse({'count': count,'email_count':email_count})


def login(request):
    uname = request.COOKIES.get('uname', '')
    context = {
        'title': '用户登陆',
        'error_name': 0,
        'error_pwd': 0,
        'error_vc': 0,
        'uname': uname,
    }
    return render(request, 'df_user/login.html', context)

#验证码显示
def verify_show(request):
    return render(request,'df_user/login.html')

def login_handle(request):  # 没有利用ajax提交表单
    # 接受请求信息
    uname = request.POST.get('username')
    upwd = request.POST.get('pwd')
    jizhu = request.POST.get('jizhu', 0)
    vc = request.POST.get('vc')

    if vc:
        vc = vc.upper()  # 转换成大写字母
    
    verifycode = request.session['verifycode']
    
    verifycode = verifycode.upper()  # 转换成大写字母
    
    user = UserInfo.objects.filter(uname=uname)
    print("user:%s" %(user))
    if len(user) == 1:  # 判断用户密码并跳转
        s1 = sha1()
        s1.update(upwd.encode('utf8'))
        if s1.hexdigest() == user[0].upwd and vc == verifycode and user[0].uname_passOrfail == True:
            url = request.COOKIES.get('url', '/')
            red = HttpResponseRedirect(url)  # 继承与HttpResponse 在跳转的同时 设置一个cookie值
            # 是否勾选记住用户名，设置cookie
            if jizhu != 0:
                red.set_cookie('uname', uname)
            else:
                red.set_cookie('uname', '', max_age=-1)  # 设置过期cookie时间，立刻过期
            request.session['user_id'] = user[0].id
            request.session['user_name'] = uname
            return red
        elif s1.hexdigest() == user[0].upwd and vc != verifycode:
            context = {
                'title': '用户名登陆',
                'error_name': 0,
                'error_pwd': 0,
                'error_vc':1,
                'uname': uname,
                'upwd': upwd,
                'user': user,
                'vc':vc,
            }
            return render(request, 'df_user/login.html', context)
        elif user[0].uname_passOrfail == False:
            messages.success(request, "你的账号存在违规行为，已被封禁。")
            context = {
                'title': '用户名登陆',
                'uname': uname,
                'upwd': upwd,
                'user': user,
                'vc': vc,
            }
            return render(request, 'df_user/login.html',context)
        else:
            context = {
                'title': '用户名登陆',
                'error_name': 0,
                'error_pwd': 1,
                'error_vc': 1,
                'uname': uname,
                'upwd': upwd,
                'user':user,
                'vc': vc,
            }
            return render(request, 'df_user/login.html', context)
    else:
        context = {
            'title': '用户名登陆',
            'error_name': 1,
            'error_pwd': 0,
            'error_vc': 0,
            'uname': uname,
            'upwd': upwd,
            'user': user,
            'vc': vc,
        }
        return render(request, 'df_user/login.html', context)


def logout(request):  # 用户登出
    request.session.flush()  # 清空当前用户所有session
    return redirect(reverse("df_goods:index"))

#修改密码
#随机生成验证码
def random_str(randomlength=8):
    str = ''
    chars = 'abcdefghijklmnopqrstuvwsyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    # str = str.upper()
    return str


@user_decorator.login
def info(request):  # 用户中心
    uid=request.session['user_id']
    user = UserInfo.objects.get(id=uid)
    browser_goods = GoodsBrowser.objects.filter(user=user).order_by("-browser_time")
    cart_num = CartInfo.objects.filter(user_id=int(uid)).count()
    goods_list = []
    if browser_goods:
        goods_list = [browser_good.good for browser_good in browser_goods]  # 从浏览商品记录中取出浏览商品
        explain = '最近浏览'
    else:
        explain = '无最近浏览'

    context = {
        'title': '用户中心',
        'page_name': 1,
        'guest_cart': 1,
        'cart_num':cart_num,
        'user_phone': user.uphone,
        'user_address': user.uaddress,
        'user_name': user.uname,
        'user':user,
        'ucheck_passOrfail':user.ucheck_passOrfail,
        'goods_list': goods_list,
        'explain': explain,
    }
    return render(request, 'df_user/user_center_info.html', context)


@user_decorator.login
def order(request, index):
    user_id = request.session['user_id']
    orders_list = OrderInfo.objects.filter(user_id=int(user_id)).order_by('-odate')
    cart_num = CartInfo.objects.filter(user_id=int(user_id)).count()
    paginator = Paginator(orders_list, 2)
    page = paginator.page(int(index))
    user = UserInfo.objects.get(id=request.session['user_id'])
    context = {
        'paginator': paginator,
        'page': page,
        'title': "用户中心",
        'user':user,
        'page_name': 1,
        'guest_cart': 1,
        'cart_num':cart_num,

    }
    return render(request, 'df_user/user_center_order.html', context)


@user_decorator.login
def site(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    if request.method == "POST":
        user.ushou = request.POST.get('ushou')
        user.uaddress = request.POST.get('uaddress')
        user.uyoubian = request.POST.get('uyoubian')
        user.uphone = request.POST.get('uphone')
        user.save()
    context = {
        'page_name': 1,
        'title': '用户中心',
        'user': user,
        'guest_cart': 1,
        'cart_num':cart_num,
    }
    return render(request, 'df_user/user_center_site.html', context)
#发布商品
@user_decorator.login
def publishers(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    typeinfos = TypeInfo.objects.all()
    if request.method == "POST":
        gtitle = request.POST.get('title')
        gpic = request.FILES.get('pic')
        gunit = user.uname
        gprice = request.POST.get('price')
        gjianjie = request.POST.get('jianjie')
        gkucun = request.POST.get('kucun')
        gcontent = request.POST.get('content')
        gtype_id = request.POST.get('type_id')
        if gtitle=="" or gpic=="" or gprice=="" or gjianjie=="" or gkucun=="" or gcontent=="":
            messages.success(request, "请完整填充信息！")
        elif int(gprice) >=100000:
            messages.success(request, "价格不能大于100000！")
        else:
            GoodsInfo.objects.create(gtitle=gtitle, gpic=gpic, gunit=gunit, gprice=gprice,gjianjie=gjianjie, gkucun=gkucun, gcontent=gcontent, gtype_id=gtype_id)
            messages.success(request, "发布商品成功")

    context = {
        'page_name': 1,
        'title': '用户中心',
        'user': user,
        'typeinfos':typeinfos,
        'guest_cart': 1,
        'cart_num': cart_num,
    }
    return render(request, 'df_user/user_publishers.html', context)
#修改资料、头像
@user_decorator.login
def changeInformation(request):
    uid = request.session['user_id']
    user = UserInfo.objects.get(id=uid)
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    #users = UserInfo.objects.filter()
    context = {
        'page_name': 1,
        'title': '用户中心',
        'user': user,
        'guest_cart': 1,
        'cart_num': cart_num,
    }
    # if request.method == "GET":
    #     page_id=str(uuid.uuid4())
    #     request.session["pageid"]=page_id
    #     return render(request, 'df_user/user_changeInformation.html', {'pageid':page_id})

    if request.method == "POST":
        logo = request.FILES.get('logo')
        if logo:
            user.ulogo = logo
        else:
            user.ulogo = user.ulogo
        user.usex = request.POST.get('sex')
        user.uage = request.POST.get('age')
        user.upersonInf = request.POST.get('personinf')
        user.save()
    return render(request, 'df_user/user_changeInformation.html', context)
#修改密码
@user_decorator.login
def changeInPwd(request):
    uid = request.session['user_id']
    user = UserInfo.objects.get(id=uid)
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    context = {
        'page_name': 1,
        'title': '用户中心',
        'user': user,
        'guest_cart': 1,
        'cart_num': cart_num,
    }
    if request.method == "POST":
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        if password=="" or password2=="":
            messages.success(request, "请输入要修改的密码！")
        elif password == password2:
            # 密码加密
            s1 = sha1()
            s1.update(password.encode('utf8'))
            encrypted_pwd = s1.hexdigest()
            user.upwd = encrypted_pwd
            user.save()
            messages.success(request, "修改成功！")
        else:
            messages.success(request, "两次密码输入不正确！")
    return render(request, 'df_user/user_changePwd.html', context)

#卖家中心-卖家进入模式
def shoper_information(request,cname):
    shoper=UserInfo.objects.get(uname=cname)
    content_username=cname
    Content = GoodsContent.objects.filter(cusername=content_username).first()
    #列举卖家上架的商品
    goods = GoodsInfo.objects.filter(gunit=content_username)
    #获取订单中的货物id,有多少该卖家的商品
    orderinfs = OrderDetailInfo.objects.filter(shopername=cname).order_by('-datatime')
    infors=GoodsInfo.objects.filter()
    # 创建Paginator一个分页对象
    #发送信息
    if 'user_id' in request.session:
        uid = request.session['user_id']
        user = UserInfo.objects.get(id=uid)
        if request.method == "POST":
            ctitle = request.POST.get('title')
            cusername = user.uname
            cusername1 = content_username
            ccontent_chart = request.POST.get('Message')
            cinformation_id = shoper.id
            if ctitle == "" or ccontent_chart == "":
                messages.success(request, "请把信息填完整，卖家能够够快回复你哦！")
            else:
                Information.objects.create(ctitle=ctitle, cusername=cusername, cusername1=cusername1,
                                           ccontent_chart=ccontent_chart, cinformation_id=cinformation_id)
                messages.success(request, "消息发送成功")
        context = {
            'goods': goods,
            'orderinfs':orderinfs,
            'name': content_username,
            'user': user,
            'shoper':shoper,
            'Content':Content,
            'infos':infors,
        }
        return render(request, 'df_user/shoper_information.html', context)
    else:
        if request.method == "POST":
            return render(request, 'df_user/login.html')
    context = {
        'goods': goods,
        'orderinfs': orderinfs,
        'name': content_username,
        'shoper': shoper,
        'Content': Content,
        'infos': infors,
    }
    return render(request, 'df_user/shoper_information.html', context)
#卖家中心-自己进入模式
def myself_information(request):
    if 'user_id' in request.session:
        uid = request.session['user_id']
        user = UserInfo.objects.get(id=uid)
        #列举卖家上架的商品
        goods = GoodsInfo.objects.filter(gunit=user.uname)
        #获取订单中的货物id,有多少该卖家的商品
        orderinfs = OrderDetailInfo.objects.filter(shopername=user.uname).order_by('-datatime')
        infors=GoodsInfo.objects.filter()

        context = {
            'goods': goods,
            'orderinfs':orderinfs,
            'user': user,
            'infors':infors,
        }
        return render(request, 'df_user/myself_information.html', context)

#消息中心
@user_decorator.login
def message(request):
    user = UserInfo.objects.get(id=request.session['user_id'])
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    #消息用户名去重
    persons = Information.objects.filter(cinformation_id=user.id).values('cusername','ccheck').distinct().order_by('cusername')
    print("消息列举:%s,消息长度：%s,消息个数:%s" %(persons, len(persons),persons.count()))
    #查询发消息者的头像
    imgs = UserInfo.objects.filter()
    context = {
        'title': '消息中心',
        'page_name': 1,
        'user':user,
        'persons':persons,
        'imgs':imgs,
        'guest_cart': 1,
        'cart_num': cart_num,
        # 'checks':checks,
    }
    return render(request, 'df_user/user_messages.html', context)
# 消息内容展示
@user_decorator.login
def person_message(request):
    user = UserInfo.objects.get(id=request.session['user_id'])#当前登录用户
    cart_num = CartInfo.objects.filter(user_id=user.id).count()
    #消息用户名去重
    persons = Information.objects.filter(cinformation_id=user.id).values('cusername','ccheck').distinct().order_by('cusername')
    #查询发消息者的头像
    imgs = UserInfo.objects.filter()
    #展示消息
    username=request.GET['username']
    informations = Information.objects.filter()
    logo=UserInfo.objects.get(uname=username)
    print("informations:%s" % (informations))
    for information in informations:
        if information.cusername == username:
            information.ccheck=True
            information.save()
    #消息回复
    user_name=UserInfo.objects.get(uname=username)#获取当前消息用户信息
    #展示回复消息
    #persons1=Information.objects.filter(cusername=cusername).values('cusername1').distinct().order_by('cusername1')
    if request.method == "POST":
        cusername = user.uname
        cusername1 = user_name.uname
        ccontent_chart = request.POST.get('title')
        cinformation_id = user_name.id
        if ccontent_chart == "":
            messages.success(request, "请输入内容！")
        else:
            Information.objects.create(cusername=cusername, cusername1=cusername1,
                                       ccontent_chart=ccontent_chart, cinformation_id=cinformation_id)
            messages.success(request, "消息发送成功")
            return redirect(reverse("df_user:message"))
    context = {
        'title': '消息中心',
        'page_name': 1,
        'user':user,
        'informations':informations,
        'persons':persons,
        'imgs':imgs,
        'logo':logo,
        'username':username,
        'user_name':user_name,
        'guest_cart': 1,
        'cart_num': cart_num,
    }
    return render(request, 'df_user/user_messages.html', context)

