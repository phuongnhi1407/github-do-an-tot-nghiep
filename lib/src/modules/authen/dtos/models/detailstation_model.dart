// class DetailStationResponse {
//   DetailStationData? data;
//   String? message;
//   int? statusCode;
//
//   DetailStationResponse({this.data, this.message, this.statusCode});
//
//   DetailStationResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new DetailStationData.fromJson(json['data']) : null;
//     message = json['message'];
//     statusCode = json['statusCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     data['message'] = this.message;
//     data['statusCode'] = this.statusCode;
//     return data;
//   }
// }
//
// class DetailStationData {
//   int? id;
//   String? stationName;
//   int? quantityAvaiable;
//   int? numOfSeats;
//   String? locationName;
//   double? longitude;
//   double? latitude;
//   String? statusName;
//   int? numOfActiveBikes;
//   int? numOfOtherBikes;
//   List<Bikes>? bikes;
//
//   DetailStationData(
//       {this.id,
//         this.stationName,
//         this.quantityAvaiable,
//         this.numOfSeats,
//         this.locationName,
//         this.longitude,
//         this.latitude,
//         this.statusName,
//         this.numOfActiveBikes,
//         this.numOfOtherBikes,
//         this.bikes});
//
//   DetailStationData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     stationName = json['stationName'];
//     quantityAvaiable = json['quantityAvaiable'];
//     numOfSeats = json['numOfSeats'];
//     locationName = json['locationName'];
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//     statusName = json['statusName'];
//     numOfActiveBikes = json['numOfActiveBikes'];
//     numOfOtherBikes = json['numOfOtherBikes'];
//     if (json['bikes'] != null) {
//       bikes = new List<Bikes>();
//       json['bikes'].forEach((v) {
//         bikes!.add(new Bikes.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['stationName'] = this.stationName;
//     data['quantityAvaiable'] = this.quantityAvaiable;
//     data['numOfSeats'] = this.numOfSeats;
//     data['locationName'] = this.locationName;
//     data['longitude'] = this.longitude;
//     data['latitude'] = this.latitude;
//     data['statusName'] = this.statusName;
//     data['numOfActiveBikes'] = this.numOfActiveBikes;
//     data['numOfOtherBikes'] = this.numOfOtherBikes;
//     if (this.bikes != null) {
//       data['bikes'] = this.bikes.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Bikes {
//   int? id;
//   String? bikeName;
//   String? statusName;
//
//   Bikes({this.id, this.bikeName, this.statusName});
//
//   Bikes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     bikeName = json['bikeName'];
//     statusName = json['statusName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['bikeName'] = this.bikeName;
//     data['statusName'] = this.statusName;
//     return data;
//   }
// }