class QrModel {
  int? id;
  String? bikeCode;
  String? stationName;
  String? location;

  QrModel({this.id, this.bikeCode, this.stationName, this.location});

  QrModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bikeCode = json['bikeCode'];
    stationName = json['stationName'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bikeCode'] = this.bikeCode;
    data['stationName'] = this.stationName;
    data['location'] = this.location;
    return data;
  }
}
