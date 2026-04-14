import 'package:atlasmart/domain/admin/manage_category/model/category_model.dart';

abstract class ManageCategoryService {
  Future<List<CategoryModel>> getAllCategories();

  Future<bool> addCategory(CategoryModel category);
  Future<bool> editCategory(CategoryModel category);
  Future<bool> deleteCategory(String id);
}
