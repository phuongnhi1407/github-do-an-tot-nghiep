class NewsRequest {
  int? notificationId;

  NewsRequest({this.notificationId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['NotificationId'] = this.notificationId;
    return data;
  }
}