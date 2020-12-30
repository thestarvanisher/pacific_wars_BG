from django.urls import path
from . import views

app_name = "other"
urlpatterns = [
    path('', views.other, name="other"),
    path('sendform', views.savedata, name="savedata"),
]