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
    return {
        'cart': Cart(request),
        'compare': Compare(request),
    }
