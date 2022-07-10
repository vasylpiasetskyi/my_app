import os

from django.shortcuts import get_object_or_404
from django.views.generic import ListView, DetailView

from shop.models import Category, Product
from cart.forms import CartAddProductForm, CompareAddProductForm


class ProductListView(ListView):
    model = Category
    template_name = 'shop/product/product_list_view.html'
    context_object_name = 'products'
    categories = Category.objects.all()
    category = None

    def get_queryset(self):
        queryset = Product.objects.filter(available=True)
        if self.kwargs.get("category_slug"):
            category = get_object_or_404(Category, slug=self.kwargs.get("category_slug"))
            queryset = queryset.filter(category=category)
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = self.category
        context['categories'] = self.categories
        return context


class ProductDetailView(DetailView):
    model = Product
    queryset = None
    template_name = 'shop/product/product_detail_view.html'
    context_object_name = 'product'
    slug_url_kwarg = 'slug'
    pk_url_kwarg = 'id'
    query_pk_and_slug = True

    cart_product_form = CartAddProductForm()
    compare_product_form = CompareAddProductForm()

    def get_context_data(self, **kwargs):

        context = super().get_context_data()
        context['cart_product_form'] = self.cart_product_form
        context['compare_product_form'] = self.compare_product_form
        return context
