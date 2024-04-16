class ProfileRequest {
  int? userId;

  ProfileRequest({this.userId});

  ProfileRequest.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    return data;
  }
}