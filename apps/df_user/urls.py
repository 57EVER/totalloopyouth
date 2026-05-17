# from django.urls import re_path as url
from django.urls import path, re_path
from django.views.static import serve
from loopyouth import settings
from .views import *
from . import viewsUtil

app_name = 'df_user'

urlpatterns = [
    re_path(r'^register/$', register, name="register"),
    re_path(r'^register_handle/$', register_handle, name="register_handle"),
    re_path(r'^register_exist/$', register_exist, name="register_exist"),
    re_path(r'^login/$', login, name="login"),
    re_path(r'^login_handle/$', login_handle, name="login_handle"),
    re_path(r'^info/$', info, name="info"),
    re_path(r'^order/(\d+)$', order, name="order"),
    re_path(r'^site/$', site, name="site"),
    re_path(r'^publishers/$',publishers,name="publishers"),
    re_path(r'^changeInformation/$',changeInformation,name="changeInformation"),
    re_path('^myself_information/$', myself_information, name="myself_information"),
    re_path('^shoper_information/(.+)/$', shoper_information, name="shoper_information"),
    re_path('^message/$', message, name="message"),
    re_path('^person_message/$', person_message, name="person_message"),
    re_path(r'^logout/$', logout, name="logout"),
    #显示验证码
    re_path(r'^verify_show/$', verify_show,name="verify_show"),
    re_path(r'^verifycode/$', viewsUtil.verify_code,name="verifycode"),
    #修改密码
    re_path(r'^changeInPwd/$', changeInPwd,name="changeInPwd"),
]