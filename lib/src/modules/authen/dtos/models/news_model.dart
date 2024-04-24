class NewsModel {
  String? message;
  int? statusCode;
  NewsData? data;
  Paging? paging;

  NewsModel({this.message, this.statusCode, this.data, this.paging});

  NewsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? NewsData.fromJson(json['data']) : null;
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
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

  NewsData.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    senderId = json['senderId'];
    senderUsername = json['senderUsername'];
    senderAvatar = json['senderAvatar'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['notificationId'] = this.notificationId;
    data['senderId'] = this.senderId;
    data['senderUsername'] = this.senderUsername;
    data['senderAvatar'] = this.senderAvatar;
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class Paging {
  int? totalCount;
  int? pageIndex;
  int? pageSize;
  int? totalPages;

  Paging({this.totalCount, this.pageIndex, this.pageSize, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = this.totalCount;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}