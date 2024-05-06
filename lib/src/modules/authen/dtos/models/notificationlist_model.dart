class NotificationResponse {
  List<NotificationData>? data;
  Paging? paging;
  String? message;
  int? statusCode;

  NotificationResponse({this.data, this.paging, this.message, this.statusCode});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
      });
    }
    paging =
    json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class NotificationData {
  int? index;
  int? notificationId;
  String? title;
  String? image;
  String? content;
  String? createdDate;
  int? totalRows;

  NotificationData(
      {this.index,
        this.notificationId,
        this.title,
        this.image,
        this.content,
        this.createdDate,
        this.totalRows});

  NotificationData.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    notificationId = json['notificationId'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    createdDate = json['createdDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['notificationId'] = this.notificationId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    data['createdDate'] = this.createdDate;
    data['totalRows'] = this.totalRows;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['pageIndex'] = this.pageIndex;
    data['pageSize'] = this.pageSize;
    data['totalPages'] = this.totalPages;
    return data;
  }
}