# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
from dotenv import load_dotenv

load_dotenv()

DEBUG = True
SECRET_KEY = os.getenv("DJANGO_SECRET_KEY_DEV", "change_me")
ALLOWED_HOSTS = ['*']
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

PROJECT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = os.path.dirname(PROJECT_DIR)
APP_DIR = os.path.dirname(os.path.dirname(PROJECT_DIR))


# print("!!!! PROJECT_DIR: ", os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# print("!!!! BASE_DIR_OLD: ", os.path.dirname(PROJECT_DIR))
# print("!!!! APP_DIR: ", os.path.dirname(os.path.dirname(PROJECT_DIR)))
# print("!!!! BASE_DIR: ", BASE_DIR)


# Application definition
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Third-party
    'allauth',
    'allauth.account',
    'crispy_forms',

    # Local
    'articles',
    'shop',
    'cart',
    'orders'
]

CRISPY_TEMPLATE_PACK = 'bootstrap4'

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'my_app.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR, 'templates'),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                # 'cart.context_processors.cart',
                # 'cart.context_processors.compare',
                'cart.context_processors.ctx',
            ],
        },
    },
]

WSGI_APPLICATION = 'my_app.wsgi.application'

# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': os.getenv("SQL_ENGINE", 'django.db.backends.postgresql'),
        'NAME': os.getenv("POSTGRES_DB", os.path.join(BASE_DIR, 'db.sqlite3')),
        'USER': os.getenv("POSTGRES_USER", "user"),
        'PASSWORD': os.getenv("POSTGRES_PASSWORD", "password"),
        'HOST': os.getenv("POSTGRES_HOST", "localhost"),
        'PORT': os.getenv("POSTGRES_PORT", "5432"),
    }
}

# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = 'en-us'
LOCALE_PATHS = (os.path.join(PROJECT_DIR, 'locale'),)

TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]

STATICFILES_DIRS = [
    os.path.join(APP_DIR, 'static'),
]

# ManifestStaticFilesStorage is recommended in production, to prevent outdated
# JavaScript / CSS assets being served from cache (e.g. after a Wagtail upgrade).
# See https://docs.djangoproject.com/en/4.0/ref/contrib/staticfiles/#manifeststaticfilesstorage
# STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'
STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.StaticFilesStorage'

STATIC_URL = '/static/'
# STATIC_ROOT = os.path.join(APP_DIR, 'static')


MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(APP_DIR, 'media')

# django-allauth config
SITE_ID = 1
AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
    'allauth.account.auth_backends.AuthenticationBackend',
)
LOGIN_URL = '/account/login'
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/'
ACCOUNT_AUTHENTICATION_METHOD = "email"
ACCOUNT_EMAIL_REQUIRED = True
ACCOUNT_UNIQUE_EMAIL = True
ACCOUNT_USERNAME_REQUIRED = False
ACCOUNT_USERNAME_BLACKLIST = ["admin", "god", "bella"]
ACCOUNT_SESSION_REMEMBER = True
ACCOUNT_LOGIN_ON_EMAIL_CONFIRMATION = True

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

# EMAIL_HOST = 'smtp.gmail.com'
# EMAIL_HOST_USER = 'your_account@gmail.com'
# EMAIL_HOST_PASSWORD = 'your_password'
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True


# LOGGING = LOGGING


CART_SESSION_ID = 'cart'
COMPARE_SESSION_ID = 'compare'



# CELERY_BROKER_URL = os.environ.get("CELERY_BROKER", "redis://redis:6379/0")
# CELERY_RESULT_BACKEND = os.environ.get("CELERY_BROKER", "redis://redis:6379/0")

CELERY_BROKER_URL = 'redis://redis:6379/0'
CELERY_RESULT_BACKEND = 'redis://redis:6379/0'
