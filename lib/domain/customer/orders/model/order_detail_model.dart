import '../../../admin/manage_orders/model/status.dart';
import '../../address/model/address_model.dart';
import '../../checkout/model/checkout_model.dart';

class OrderDetailModel {
  final String orderNumber;
  final String purchaseDate;
  final List<OrderProduct> orderedProducts;
  final AddressModel deliveryAddress;
  final Summary priceSummary;
  final List<StatusHistoryItem> statusHistory;

  OrderDetailModel({
    required this.orderNumber,
    required this.purchaseDate,
    required this.orderedProducts,
    required this.deliveryAddress,
    required this.priceSummary,
    required this.statusHistory,
  });
}

class OrderProduct {
  final String productName;
  final String productImage;

  final String brandname;
  int? qty;

  OrderProduct({
    required this.productName,
    required this.productImage,
    required this.brandname,this.qty
  });
}
