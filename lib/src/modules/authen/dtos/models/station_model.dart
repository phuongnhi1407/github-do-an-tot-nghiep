class StationResponse {
  List<StationData>? data;
  Paging? paging;
  String? message;
  int? statusCode;

  StationResponse({this.data, this.paging, this.message, this.statusCode});

  StationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StationData>[];
      json['data'].forEach((v) {
        data!.add(new StationData.fromJson(v));
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

class StationData {
  int? index;
  int? id;
  String? stationName;
  int? quantityAvaiable;
  int? numOfSeats;
  int? locationId;
  String? locationName;
  int? statusId;
  String? statusName;
  String? createdDate;
  String? updatedDate;
  int? totalRows;

  StationData(
      {this.index,
        this.id,
        this.stationName,
        this.quantityAvaiable,
        this.numOfSeats,
        this.locationId,
        this.locationName,
        this.statusId,
        this.statusName,
        this.createdDate,
        this.updatedDate,
        this.totalRows});

  StationData.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    stationName = json['stationName'];
    quantityAvaiable = json['quantityAvaiable'];
    numOfSeats = json['numOfSeats'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['id'] = this.id;
    data['stationName'] = this.stationName;
    data['quantityAvaiable'] = this.quantityAvaiable;
    data['numOfSeats'] = this.numOfSeats;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
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