from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse

from .models import Article


class ArticleTests(TestCase):

    def setUp(self):
        self.user = get_user_model().objects.create_user(
            username='reviewuser',
            email='reviewuser@email.com',
            password='testpass123'
        )
        self.article = Article.objects.create(
            title="Test title",
            body="Some body test text",
            author=self.user
        )

    def test_article_listing(self):
        self.assertEqual(f'{self.article.title}', 'Test title')
        self.assertEqual(f'{self.article.body}', 'Some body test text')
        self.assertEqual(f'{self.article.author}', 'reviewuser')

    def test_article_list_view_for_logged_in_user(self):
        self.client.login(email='reviewuser@email.com', password='testpass123')
        response = self.client.get(reverse('article_list'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Test title')
        self.assertTemplateUsed(response, 'articles/article_list.html')

    def test_article_list_view_for_logged_out_user(self):
        self.client.logout()
        response = self.client.get(reverse('article_list'))
        self.assertEqual(response.status_code, 200)
        article = Article.objects.get(title='Test title')
        response = self.client.get(f'/article/{article.id}/edit/')
        self.assertEqual(response.status_code, 302)
        response = self.client.get(
            '%s?next=/article/%s/edit/' % (reverse('account_login'), article.id))
        self.assertContains(response, 'Sign In')
