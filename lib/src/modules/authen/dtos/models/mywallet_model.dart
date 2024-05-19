class UserWalletResponse {
  final UserWalletData data;
  final String? message;
  final int statusCode;

  UserWalletResponse({
    required this.data,
    this.message,
    required this.statusCode,
  });

  factory UserWalletResponse.fromJson(Map<String, dynamic> json) {
    return UserWalletResponse(
      data: UserWalletData.fromJson(json['data']),
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}

class UserWalletData {
  final int currentPoint;
  final int debtCharge;

  UserWalletData({
    required this.currentPoint,
    required this.debtCharge,
  });

  factory UserWalletData.fromJson(Map<String, dynamic> json) {
    return UserWalletData(
      currentPoint: json['currentPoint'],
      debtCharge: json['debtCharge'],
    );
  }
}
