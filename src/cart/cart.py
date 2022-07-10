from decimal import Decimal
from django.conf import settings
from shop.models import Product


class Cart(object):

    def __init__(self, request):
        print("!!!!!!START")
        """
        Initialize the cart.
        """
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            # save an empty cart in the session
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart

    def __iter__(self):
        """
        Iterate over the items in the cart and get the products
        from the database.
        """
        product_ids = self.cart.keys()
        # get the product objects and add them to the cart
        products = Product.objects.filter(id__in=product_ids)

        cart = self.cart.copy()
        for product in products:
            cart[str(product.id)]['product'] = product

        for item in cart.values():
            item['price'] = float(item['price'])
            item['total_price'] = float(item['price']) * item['quantity']
            yield item

    def __len__(self):
        """
        Count all items in the cart.
        """
        return sum(item['quantity'] for item in self.cart.values())

    def add(self, product, quantity=1, override_quantity=False):
        """
        Add a product to the cart or update its quantity.
        """
        product_id = str(product.id)
        if product_id not in self.cart:
            self.cart[product_id] = {'quantity': 0,
                                     'price': str(product.price),}
        if override_quantity:
            self.cart[product_id]['quantity'] = quantity
        else:
            self.cart[product_id]['quantity'] += quantity
        self.save()

    def save(self):
        # mark the session as "modified" to make sure it gets saved
        self.session.modified = True

    def remove(self, product):
        """
        Remove a product from the cart.
        """
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()

    def clear(self):
        # remove cart from session
        del self.session[settings.CART_SESSION_ID]
        self.save()

    def get_total_price(self):
        return sum(float(item['price']) * item['quantity'] for item in self.cart.values())


class Compare(object):

    def __init__(self, request):
        """
        Initialize the compare.
        """
        self.session = request.session
        compare = self.session.get(settings.COMPARE_SESSION_ID)
        if not compare:
            # save an empty compare in the session
            compare = self.session[settings.COMPARE_SESSION_ID] = {}
        self.compare = compare

    def __iter__(self):
        """
        Iterate over the items in the compare and get the products
        from the database.
        """
        product_ids = self.compare.keys()
        # get the product objects and add them to the compare
        products = Product.objects.filter(id__in=product_ids)

        compare = self.compare.copy()
        for product in products:
            compare[str(product.id)]['product'] = product

        for item in compare.values():
            yield item

    def __len__(self):
        """
        Count all items in the compare.
        """
        return sum(item['quantity'] for item in self.compare.values())

    def add(self, product, quantity=1):
        """
        Add a product to the compare or update its quantity.
        """
        product_id = str(product.id)
        if product_id not in self.compare:
            self.compare[product_id] = {'quantity': 1, }
        self.save()

    def save(self):
        # mark the session as "modified" to make sure it gets saved
        self.session.modified = True

    def remove(self, product):
        """
        Remove a product from the compare.
        """
        product_id = str(product.id)
        if product_id in self.compare:
            del self.compare[product_id]
            self.save()

    def clear(self):
        # remove compare from session
        del self.session[settings.COMPARE_SESSION_ID]
        self.save()
