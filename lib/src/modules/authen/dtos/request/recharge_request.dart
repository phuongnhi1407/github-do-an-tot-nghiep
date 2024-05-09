class RechargeRequest {
  int? point;
  bool? isSuccess;

  RechargeRequest({this.point, this.isSuccess});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'point': point,
      'isSuccess': isSuccess,
    };
    return data;
  }
}