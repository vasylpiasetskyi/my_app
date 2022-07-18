from django.urls import path
from . import views

app_name = 'orders'

urlpatterns = [
    path('create/', views.order_create, name='order_create'),
    path('my-orders/', views.OrderListView.as_view(), name='orders_list'),
    path('clr/', views.clr, name='celery_test'),
]
