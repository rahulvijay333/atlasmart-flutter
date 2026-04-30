abstract class OrderService {
  Future getOrderedProductList(int page);
  Future getOrderDetails(String orderId);
}
