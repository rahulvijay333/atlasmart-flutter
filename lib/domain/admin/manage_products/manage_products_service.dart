import 'model/admin_products_model.dart';

abstract class ManageProductsService {
  getAllProducts();

  addProduct(AdminProductsModel product);

  editProduct(AdminProductsModel product);
  deleteProduct(String id);
}
