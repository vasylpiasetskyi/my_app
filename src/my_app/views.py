from django.contrib.auth.models import User
from django.views.generic import TemplateView


class HomePageView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        count = User.objects.count()
        context['count'] = count
        return context


class AboutPageView(TemplateView):
    template_name = 'about.html'
