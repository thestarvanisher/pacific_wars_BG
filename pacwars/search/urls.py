from django.urls import path
from . import views

app_name = "search"
urlpatterns = [
    path('', views.index, name="index"),
   # path('<str:battle_code>/', views.detail, name="detail"),
    path('results/', views.results, name="results"),
]