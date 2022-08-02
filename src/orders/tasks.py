from __future__ import absolute_import, unicode_literals
import random
from time import sleep

from celery.utils.log import get_task_logger

from django.core.mail import send_mail
from .models import Order
from my_app.celery import app as celery_app


@celery_app.task
def order_created(order_id):
    """
    Task to send an e-mail notification when an order is
    successfully created.
    """
    order = Order.objects.get(id=order_id)
    subject = f'Order nr. {order.id}'
    message = f'Dear {order.first_name},\n\n' \
              f'You have successfully placed an order.' \
              f'Your order ID is {order.id}.'
    mail_sent = send_mail(subject,
                          message,
                          'admin@myshop.com',
                          [order.email])
    sleep(100)
    return mail_sent


@celery_app.task
def rand():
    return 1 + 2
