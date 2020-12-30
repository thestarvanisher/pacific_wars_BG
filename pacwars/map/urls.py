from django.urls import path
from . import views

app_name = "map"
urlpatterns = [
    path('', views.map, name="map"),
    path('update/', views.mapupdate, name="mapupdate"),
   # path('<str:battle_code>/', views.detail, name="detail"),
   # path('results/', views.results, name="mapres"),
]