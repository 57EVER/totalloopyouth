from django.db import models

from ..df_user.models import UserInfo
from ..df_goods.models import GoodsInfo

#  用户表与商品表则将关系维护在购物车表中

class CartInfo(models.Model):

    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name="用户")
    goods = models.ForeignKey(GoodsInfo, on_delete=models.CASCADE, verbose_name="商品")
    count = models.IntegerField(verbose_name="", default=0)  # 记录用户买个多少单位的商品

    class Meta:
        verbose_name = "购物车"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.uname + '的购物车'
