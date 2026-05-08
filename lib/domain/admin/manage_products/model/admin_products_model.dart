import 'package:image_picker/image_picker.dart';

class AdminProductsModel {
  final String name;
  final String description;
  final String price;
  final String? image;
  final String? categoryid;
  final String? stock;
  final String? categoryName;
  String? id;
  String? brandName;
  String? companyName;

  XFile? newProfileImage;

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
    this.brandName,
    this.companyName,
  });

  AdminProductsModel copyWith({
    String? name,
    String? description,
    String? price,
    String? image,
    String? categoryId,
    String? stock,
    XFile? newProfileImage,
  }) {
    return AdminProductsModel(
      categoryName: categoryName,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      categoryid: categoryId ?? categoryid,
      stock: stock ?? this.stock,
      newProfileImage: newProfileImage,
      id: id,
    );
  }
}
