import 'dart:io';

class CategoryModel {
  final String categoryName;
  final String categoryImage;
  String? id;

  File? selectedImage;

  CategoryModel({
    required this.categoryName,
    required this.categoryImage,
    this.id,
    this.selectedImage,
  });

  CategoryModel copyWith(String name, String image, File? selectedImage) {
    return CategoryModel(
      categoryName: name,
      categoryImage: image,
      id: id,
      selectedImage: selectedImage,
    );
  }
}
