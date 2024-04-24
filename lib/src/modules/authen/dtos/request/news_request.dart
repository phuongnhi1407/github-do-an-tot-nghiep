class NewsRequest {
  int? notificationId;

  NewsRequest({this.notificationId});

  NewsRequest.fromJson(Map<String, dynamic> json) {
    notificationId = json['NotificationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['NotificationId'] = this.notificationId;
    return data;
  }
}