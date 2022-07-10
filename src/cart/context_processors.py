from .cart import Cart, Compare


# def cart(request):
#     return {
#         'cart': Cart(request),
#     }
#
#
# def compare(request):
#     return {
#         'compare': Compare(request),
#     }


def ctx(request):
    x = Cart(request)

    y = Compare(request)

    print(x.cart)
    print(y.compare)

    return {
        'cart': x,
        'compare': y,
    }
