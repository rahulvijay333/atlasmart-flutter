import 'package:image_picker/image_picker.dart';

class CategoryModel {
  final String categoryName;
  final String categoryImage;
  String? id;

  XFile? selectedImage;

  CategoryModel({
    required this.categoryName,
    required this.categoryImage,
    this.id,
    this.selectedImage,
  });

  CategoryModel copyWith(String name, String image, XFile? selectedImage) {
    return CategoryModel(
      categoryName: name,
      categoryImage: image,
      id: id,
      selectedImage: selectedImage,
    );
  }
}
