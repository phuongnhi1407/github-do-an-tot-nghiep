class SignUpRequest {
  String? fullname;
  String? username;
  String? email;
  String? password;
  String? phonenumber;
  String? address;

  SignUpRequest({
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.phonenumber,
    this.address,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    fullname = json['fullName'];
    username = json['userName'];
    email = json['email'];
    password = json['password'];
    phonenumber = json['phoneNumber'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullname;
    data['userName'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phoneNumber'] = this.phonenumber;
    data['address'] = this.address;
    return data;
  }
}