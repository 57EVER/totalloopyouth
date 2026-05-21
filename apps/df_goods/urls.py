
from django.urls import path, re_path

from django.views.static import serve
from loopyouth import settings
from . import views

app_name = 'df_goods'

urlpatterns = [
    re_path('^$', views.index, name="index"),
    re_path('^index/$', views.index, name="index"),
    re_path('^list(\d+)_(\d+)_(\d+)/$', views.good_list, name="good_list"),
    re_path('^detail/(\d+)/$', views.detail, name="detail"),
    re_path('^content/(\d+)/(\d+)/$', views.content, name="content"),
    re_path(r'^search/', views.ordinary_search, name="ordinary_search"),  # 全文检索
    re_path('^media/(?P<path>.*)/$',serve,{'document_root':settings.MEDIA_ROOT}),
]
