class CartModel {
  final String id;
  final String productId;
  final String name;
  final String image;
  final String brandName;
  final String company;
  final int stock;
  final String price;
  final int qty;

  CartModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.brandName,
    required this.company,
    required this.stock,
    required this.price,
    required this.qty,
  });
}
