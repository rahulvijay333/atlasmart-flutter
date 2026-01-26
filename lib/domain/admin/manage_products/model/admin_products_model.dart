import 'dart:io';

class AdminProductsModel {
  final String name;
  final String description;
  final String price;
  final String? image;
  final String? category;
  final String? stock;
   String? id;

  File? newProfileImage;

  AdminProductsModel({
    required this.name,
    required this.description,
    required this.price,
    this.image,
    this.category,
    this.stock,
    this.newProfileImage,
    this.id
  });

  AdminProductsModel copyWith({
    String? name,
    String? description,
    String? price,
    String? image,
    String? category,
    String? stock,
    File? newProfileImage,
  }) {
    return AdminProductsModel(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      stock: stock ?? this.stock,

      newProfileImage: newProfileImage,
    );
  }
}
