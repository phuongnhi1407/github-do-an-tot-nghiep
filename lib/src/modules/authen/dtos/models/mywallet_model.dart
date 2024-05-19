class MyWalletResponse {
  MyWalletData? data;
  String? message;
  int? statusCode;

  MyWalletResponse({this.data, this.message, this.statusCode});

  MyWalletResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new MyWalletData.fromJson(json['data']) : null;
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

class MyWalletData {
  double? currentPoint;
  double? debtCharge;

  MyWalletData({this.currentPoint, this.debtCharge});

  MyWalletData.fromJson(Map<String, dynamic> json) {
    currentPoint = json['currentPoint'];
    debtCharge = json['debtCharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPoint'] = this.currentPoint;
    data['debtCharge'] = this.debtCharge;
    return data;
  }
}
