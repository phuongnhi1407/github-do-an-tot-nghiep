class ProfileResponse {
  String? message;
  int? statusCode;
  ProfileData? data;
  Paging? paging;

  ProfileResponse({this.message, this.statusCode, this.data, this.paging});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  int? totalRows;
  int? id;
  String? fullName;
  String? dateOfBirth;
  int? avatarId;
  String? address;
  String? email;
  String? cardId;
  String? phoneNumber;
  bool? isConfirm;
  String? createdDate;
  String? updatedDate;
  bool? isDeleted;
  String? timeZone;

  ProfileData(
      {this.totalRows,
        this.id,
        this.fullName,
        this.dateOfBirth,
        this.avatarId,
        this.address,
        this.email,
        this.cardId,
        this.phoneNumber,
        this.isConfirm,
        this.createdDate,
        this.updatedDate,
        this.isDeleted,
        this.timeZone});

  ProfileData.fromJson(Map<String, dynamic> json) {
    totalRows = json['totalRows'];
    id = json['id'];
    fullName = json['fullName'];
    dateOfBirth = json['dateOfBirth'];
    avatarId = json['avatarId'];
    address = json['address'];
    email = json['email'];
    cardId = json['cardId'];
    phoneNumber = json['phoneNumber'];
    isConfirm = json['isConfirm'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    isDeleted = json['isDeleted'];
    timeZone = json['timeZone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalRows'] = this.totalRows;
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['avatarId'] = this.avatarId;
    data['address'] = this.address;
    data['email'] = this.email;
    data['cardId'] = this.cardId;
    data['phoneNumber'] = this.phoneNumber;
    data['isConfirm'] = this.isConfirm;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['isDeleted'] = this.isDeleted;
    data['timeZone'] = this.timeZone;
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