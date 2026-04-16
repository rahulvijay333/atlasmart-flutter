import '../../../customer/address/model/address_model.dart';
import '../../../customer/orders/model/order_detail_model.dart';
import 'status.dart';

class ManageAdminOrderModel {
  final String orderNumber;
  final String orderId;
  final String customerName;
  final String customerEmail;
  final String date;
  final String totalAmount;
  final List<StatusHistoryItem> statusHistory;
  final List<OrderProduct> orderedItems;
  final AddressModel customerAddress;
  final int currentPage;
  final int totalPages;

  ManageAdminOrderModel({
    required this.orderNumber,
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.date,
    required this.totalAmount,
    required this.statusHistory,
    required this.orderedItems,
    required this.customerAddress, required this.currentPage, required this.totalPages,
  });
}
