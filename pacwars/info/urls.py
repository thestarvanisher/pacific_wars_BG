from django.urls import path
from . import views

app_name = "info"
urlpatterns = [
    path('', views.info, name="info"),
    path('b/<battleid>/', views.getinfo, name="getinfo"),
    path('p/<personid>/', views.getperson, name="getperson")
   # path('<str:battle_code>/', views.detail, name="detail"),
   # path('results/', views.results, name="mapres"),
]