from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.views.decorators.http import require_POST
from shop.models import Product
from .cart import Cart, Compare
from .forms import CartAddProductForm, CompareAddProductForm


@require_POST
def cart_add(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product,
                 quantity=cd['quantity'],
                 override_quantity=cd['override'])
    return redirect('cart:cart_detail')


@require_POST
def cart_remove(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:cart_detail')


def cart_detail(request):
    cart = Cart(request)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'],
                                                                   'override': True})
    return render(request, 'cart/cart_detail.html', {'cart': cart})


@require_POST
def compare_add(request, product_id):
    compare = Compare(request)
    product = get_object_or_404(Product, id=product_id)
    form = CompareAddProductForm(request.POST)
    if form.is_valid():
        compare.add(product=product,
                    quantity="1", )
    return redirect('shop:product_detail', slug=product.slug, id=product_id)


@require_POST
def compare_remove(request, product_id):
    compare = Compare(request)
    product = get_object_or_404(Product, id=product_id)
    compare.remove(product)
    return redirect('cart:compare_detail')


def compare_detail(request):
    compare = Compare(request)
    products = Product.objects.filter(id__in=compare.compare).all()
    return render(request, 'compare/compare_detail.html', {'compare': compare, 'products': products}, )
