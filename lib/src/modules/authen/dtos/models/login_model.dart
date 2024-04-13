
class LoginResponse {
  LoginModel? data;
  String? message;  
  int? statusCode;

  LoginResponse({this.data, this.message, this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginModel.fromJson(json['data']) : null;
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

class LoginModel {
  String? accessToken;
  String? expiredToken;
  String? refreshToken;
  String? expiredRefreshToken;
  String? typeToken;
  String? urlRedirect;
  bool? isSuperAdmin;
  List<Null>? roles;
  InfoUser? infoUser;
  bool? isFail;
  Null? message;
  int? statusCode;

  LoginModel(
      {this.accessToken,
      this.expiredToken,
      this.refreshToken,
      this.expiredRefreshToken,
      this.typeToken,
      this.urlRedirect,
      this.isSuperAdmin,
      // this.roles,
      this.infoUser,
      this.isFail,
      this.message,
      this.statusCode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiredToken = json['expiredToken'];
    refreshToken = json['refreshToken'];
    expiredRefreshToken = json['expiredRefreshToken'];
    typeToken = json['typeToken'];
    urlRedirect = json['urlRedirect'];
    isSuperAdmin = json['isSuperAdmin'];
    // if (json['roles'] != null) {
    //   roles = <Null>[];
    //   json['roles'].forEach((v) {
    //     roles!.add(Null.fromJson(v));
    //   });
    // }
    infoUser = json['infoUser'] != null
        ? new InfoUser.fromJson(json['infoUser'])
        : null;
    isFail = json['isFail'];
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiredToken'] = this.expiredToken;
    data['refreshToken'] = this.refreshToken;
    data['expiredRefreshToken'] = this.expiredRefreshToken;
    data['typeToken'] = this.typeToken;
    data['urlRedirect'] = this.urlRedirect;
    data['isSuperAdmin'] = this.isSuperAdmin;
    // if (this.roles != null) {
    //   data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    // }
    if (this.infoUser != null) {
      data['infoUser'] = this.infoUser!.toJson();
    }
    data['isFail'] = this.isFail;
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class InfoUser {
  int? id;
  String? fullName;
  String? userName;
  String? address;
  String? email;
  String? phoneNumber;
  Null? dateOfBirth;
  String? timeZone;
  Null? avatarPath;

  InfoUser(
      {this.id,
      this.fullName,
      this.userName,
      this.address,
      this.email,
      this.phoneNumber,
      this.dateOfBirth,
      this.timeZone,
      this.avatarPath});

  InfoUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    timeZone = json['timeZone'];
    avatarPath = json['avatarPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['timeZone'] = this.timeZone;
    data['avatarPath'] = this.avatarPath;
    return data;
  }
}
