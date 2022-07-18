from django.contrib import admin

from articles.models import Article


class ArticleAdmin(admin.ModelAdmin):
    list_display = ("title", "body", "author", "date",)


admin.site.register(Article, ArticleAdmin)
