from .base import *


DEBUG = False
SECRET_KEY = os.getenv("DJANGO_SECRET_KEY_PROD")
ALLOWED_HOSTS = []
CSRF_TRUSTED_ORIGINS = []


try:
    from .local import *
except ImportError:
    pass
