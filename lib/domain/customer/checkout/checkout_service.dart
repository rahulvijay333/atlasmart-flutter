abstract class CheckoutService {
  Future checkout(String addressId);

  Future updatePaymentStatus(String orderId,String paymentId,String signature);

}
