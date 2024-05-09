class MyWalletRequest {
  int? userId;

  MyWalletRequest({this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['UserId'] = this.userId;
    return data;
  }
}