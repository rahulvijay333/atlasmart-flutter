class NotificationModel {
  final String title;
  final String description;
  final String date;
  final String type;
  String? navigateTo;
  String? parameter;

  NotificationModel({
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    this.parameter,
  });
}
