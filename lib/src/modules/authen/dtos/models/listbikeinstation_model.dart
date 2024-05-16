class ListBikeResponse {
  List<ListBikeData>? data;
  Paging? paging;
  String? message;
  int? statusCode;

  ListBikeResponse({this.data, this.paging, this.message, this.statusCode});

  ListBikeResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ListBikeData>[];
      json['data'].forEach((v) {
        data!.add(new ListBikeData.fromJson(v));
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

class ListBikeData {
  Index? index;
  int? id;
  String? bikeName;
  int? locationId;
  String? locationName;
  int? lockId;
  String? lockName;
  int? statusId;
  String? statusName;
  int? stationId;
  String? stationName;
  String? createdDate;
  int? totalRows;

  ListBikeData(
      {this.index,
        this.id,
        this.bikeName,
        this.locationId,
        this.locationName,
        this.lockId,
        this.lockName,
        this.statusId,
        this.statusName,
        this.stationId,
        this.stationName,
        this.createdDate,
        this.totalRows});

  ListBikeData.fromJson(Map<String, dynamic> json) {
    index = json['index'] != null ? new Index.fromJson(json['index']) : null;
    id = json['id'];
    bikeName = json['bikeName'];
    locationId = json['locationId'];
    locationName = json['locationName'];
    lockId = json['lockId'];
    lockName = json['lockName'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    stationId = json['stationId'];
    stationName = json['stationName'];
    createdDate = json['createdDate'];
    totalRows = json['totalRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.index != null) {
      data['index'] = this.index;
    }
    data['id'] = this.id;
    data['bikeName'] = this.bikeName;
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['lockId'] = this.lockId;
    data['lockName'] = this.lockName;
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
    data['stationId'] = this.stationId;
    data['stationName'] = this.stationName;
    data['createdDate'] = this.createdDate;
    data['totalRows'] = this.totalRows;
    return data;
  }
}

class Index {
  int? value;
  bool? isFromEnd;

  Index({this.value, this.isFromEnd});

  Index.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    isFromEnd = json['isFromEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['isFromEnd'] = this.isFromEnd;
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