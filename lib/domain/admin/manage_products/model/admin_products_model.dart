class AdminProductsModel {
  final String name;
  final String description;
  final String price;
  final String? image;
  final String? category;
  final String? stock;

  AdminProductsModel({
    required this.name,
    required this.description,
    required this.price,
    this.image,
    this.category,
    this.stock,
  });

  AdminProductsModel copyWith({
    String? name,
    String? description,
    String? price,
    String? image,
    String? category,
    String? stock,
  }) {
    return AdminProductsModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      stock: stock ?? this.stock,
    );
  }
}
