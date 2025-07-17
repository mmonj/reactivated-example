from django.urls import path

from temp_app import views

app_name = "temp_app"

urlpatterns = [
    path("", views.index, name="index"),
]
