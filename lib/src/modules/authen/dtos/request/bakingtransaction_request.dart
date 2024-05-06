class BakingRequest {
  int? userId;
  int? point;
  bool? isSuccess;

  BakingRequest({this.userId, this.point, this.isSuccess});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['UserId'] = this.userId;
    data['Point'] = this.point;
    data['IsSuccess'] = this.isSuccess;
    return data;
  }
}