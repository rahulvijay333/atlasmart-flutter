abstract class CartService {
  Future addOrUpdateCart(String cartId, String productId, String qty);
  Future getCart();
  Future deleteCart(String id);
  Future deleleAllCart();
}
