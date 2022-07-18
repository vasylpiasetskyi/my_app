import logging
from celery.utils.log import get_task_logger

from django.shortcuts import render
from django.views.generic import ListView

from cart.cart import Cart
from .models import OrderItem, Order
from .forms import OrderCreateForm
from .tasks import order_created, rand

from django.http import HttpResponse


def order_create(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            order.client = request.user
            order.save()
            for item in cart:
                OrderItem.objects.create(order=order,
                                         product=item['product'],
                                         price=item['price'],
                                         quantity=item['quantity'])
            # clear the cart
            cart.clear()
            # launch asynchronous task
            order_created.delay(order.id)
            # order_created(order.id)
            return render(request,
                          'orders/order/created.html',
                          {'order': order})
    else:
        form = OrderCreateForm()
    return render(request,
                  'orders/order/create.html',
                  {'cart': cart, 'form': form})


class OrderListView(ListView):
    model = Order
    template_name = 'orders/order/order_list.html'
    context_object_name = 'orders'

    def get_queryset(self):
        queryset = Order.objects.filter(client=self.request.user).all()
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


def clr(request):
    rand.delay()
    return HttpResponse('<h1>CELERY TEST!!!!</h1>')
