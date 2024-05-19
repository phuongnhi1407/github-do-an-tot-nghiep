class Bike {
  int? id;
  String? bikeName;
  String? statusName;

  Bike({this.id, this.bikeName, this.statusName});

  Bike.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bikeName = json['bikeName'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bikeName'] = this.bikeName;
    data['statusName'] = this.statusName;
    return data;
  }
}

class StationDetailData {
  int? id;
  String? stationName;
  int? quantityAvaiable;
  int? numOfSeats;
  String? locationName;
  int? longitude;
  int? latitude;
  int? statusId;
  String? statusName;
  int? numOfActiveBikes;
  int? numOfOtherBikes;
  List<Bike>? bikes;

  StationDetailData({
    this.id,
    this.stationName,
    this.quantityAvaiable,
    this.numOfSeats,
    this.locationName,
    this.longitude,
    this.latitude,
    this.statusId,
    this.statusName,
    this.numOfActiveBikes,
    this.numOfOtherBikes,
    this.bikes,
  });

  StationDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationName = json['stationName'];
    quantityAvaiable = json['quantityAvaiable'];
    numOfSeats = json['numOfSeats'];
    locationName = json['locationName'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    numOfActiveBikes = json['numOfActiveBikes'];
    numOfOtherBikes = json['numOfOtherBikes'];
    if (json['bikes'] != null) {
      bikes = [];
      json['bikes'].forEach((v) {
        bikes!.add(new Bike.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stationName'] = this.stationName;
    data['quantityAvaiable'] = this.quantityAvaiable;
    data['numOfSeats'] = this.numOfSeats;
    data['locationName'] = this.locationName;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
    data['numOfActiveBikes'] = this.numOfActiveBikes;
    data['numOfOtherBikes'] = this.numOfOtherBikes;
    if (this.bikes != null) {
      data['bikes'] = this.bikes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StationDetailResponse {
  StationDetailData? data;
  String? message;
  int? statusCode;

  StationDetailResponse({this.data, this.message, this.statusCode});

  StationDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new StationDetailData.fromJson(json['data']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
