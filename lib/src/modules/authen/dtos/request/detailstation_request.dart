class StationDetailRequest {
  int? id;

  StationDetailRequest({this.id});

  StationDetailRequest.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    return data;
  }
}