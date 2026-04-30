abstract class ManageOrderService {
  Future getAllOrders(int page);
  Future updateOrderStatus({
    required String orderId,
    required String status,
    required String note,
  });
}
