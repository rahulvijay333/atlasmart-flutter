abstract class HomeService {
  Future loadHome();
  Future searchProduct(String searchKey);
  Future searchByCategory(String categoryId);
}
