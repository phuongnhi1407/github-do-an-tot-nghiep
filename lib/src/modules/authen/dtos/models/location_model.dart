class LocationResponse {
  List<LocationData>? data;
  Paging? paging;
  String? message;
  int? statusCode;

  LocationResponse({this.data, this.paging, this.message, this.statusCode});

  LocationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LocationData>[];
      json['data'].forEach((v) {
        data!.add(new LocationData.fromJson(v));
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

class LocationData {
  int? index;
  int? id;
  String? locationName;
  String? logitude;
  String? latitude;
  String? createdDate;
  String? updatedDate;
  int? totalRows;

  LocationData(
      {this.index,
        this.id,
        this.locationName,
        this.logitude,
        this.latitude,
        this.createdDate,
        this.updatedDate,
        this.totalRows});

  LocationData.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    locationName = json['locationName'];
    logitude = json['logitude'];
    latitude = json['latitude'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['id'] = this.id;
    data['locationName'] = this.locationName;
    data['logitude'] = this.logitude;
    data['latitude'] = this.latitude;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
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