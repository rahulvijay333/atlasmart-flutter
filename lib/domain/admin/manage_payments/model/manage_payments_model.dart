class ManagePaymentsModel {
  final String paymentid;
  final String totalAmount;
  final String status;
  final String date;
  final String customerName;
  final String orderNumber;

  ManagePaymentsModel({
    required this.paymentid,
    required this.totalAmount,
    required this.status,
    required this.date,
    required this.customerName,
    required this.orderNumber,
  });
}
