abstract class ManageOrderService {
  Future getAllOrders();
  Future updateOrderStatus({
    required String orderId,
    required String status,
    required String note,
  });
}
