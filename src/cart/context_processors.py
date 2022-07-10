from .cart import Cart, Compare


def cart(request):
    return {'cart': Cart(request),
            }


def compare(request):
    return {
        'compare': Compare(request),
    }
