class NewsResponse {
  String? message;
  int? statusCode;
  NewsData? data;
  Paging? paging;

  NewsResponse({this.message, this.statusCode, this.data, this.paging});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? NewsData.fromJson(json['data']) : null,
      paging: json['paging'] != null ? Paging.fromJson(json['paging']) : null,
    );
  }
}

class NewsData {
  int? notificationId;
  int? senderId;
  String? senderUsername;
  String? senderAvatar;
  String? title;
  String? image;
  String? content;
  String? createdDate;

  NewsData({
    this.notificationId,
    this.senderId,
    this.senderUsername,
    this.senderAvatar,
    this.title,
    this.image,
    this.content,
    this.createdDate,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      notificationId: json['notificationId'],
      senderId: json['senderId'],
      senderUsername: json['senderUsername'],
      senderAvatar: json['senderAvatar'],
      title: json['title'],
      image: json['image'],
      content: json['content'],
      createdDate: json['createdDate'],
    );
  }
}

class Paging {
  int? totalCount;
  int? pageIndex;
  int? pageSize;
  int? totalPages;

  Paging({this.totalCount, this.pageIndex, this.pageSize, this.totalPages});

  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      totalCount: json['totalCount'],
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
    );
  }
}