class DeleteResponse {
  String? message;
  int? statusCode;
  bool? data;

  DeleteResponse({this.message, this.statusCode, this.data});

  DeleteResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    data = json['data'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['data'] = this.data;
    return data;
  }
}
