class AdminDashboardModel {
  final int userCount;
  final int orderCount;
  final String totalRevenue;
  final int productsCount;

  AdminDashboardModel({
    required this.userCount,
    required this.orderCount,
    required this.totalRevenue,
    required this.productsCount,
  });
}
