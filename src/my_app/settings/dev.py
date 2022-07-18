from .base import *

DEBUG = True
SECRET_KEY = os.getenv("DJANGO_SECRET_KEY_DEV", "change_me")
ALLOWED_HOSTS = ['*']
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
# EMAIL_BACKEND = "mailer.backend.DbBackend"


try:
    from .local import *
except ImportError:
    pass

