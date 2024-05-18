class RechargeResponse {
  String? data;
  String? message;
  int? statusCode;

  RechargeResponse({this.data, this.message, this.statusCode});

  RechargeResponse.fromJson(Map<String, dynamic> json) {
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