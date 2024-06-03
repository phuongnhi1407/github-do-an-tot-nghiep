class ActivateBikeResponse {
  bool? data;
  String? message;
  int? statusCode;

  ActivateBikeResponse({this.data, this.message, this.statusCode});

  ActivateBikeResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}