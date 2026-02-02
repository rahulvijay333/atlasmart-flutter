import 'dart:io';

class AdminProductsModel {
  final String name;
  final String description;
  final String price;
  final String? image;
  final String? categoryid;
  final String? stock;
  final String? categoryName;
  String? id;

  File? newProfileImage;

  AdminProductsModel({
    required this.name,
    required this.description,
    required this.price,
    this.categoryName,
    this.image,
    this.categoryid,
    this.stock,
    this.newProfileImage,
    this.id,
  });

  AdminProductsModel copyWith({
    String? name,
    String? description,
    String? price,
    String? image,
    String? categoryId,
    String? stock,
    File? newProfileImage,
  }) {
    return AdminProductsModel(
      categoryName: categoryName,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryid: categoryId ?? this.categoryid,
      stock: stock ?? this.stock,
      newProfileImage: newProfileImage,
      id: id
    );
  }
}
