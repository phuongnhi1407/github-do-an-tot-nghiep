class LoginModel {
  String? token;

  LoginModel({this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

//Vidu
// UserModel
// jsonUser = {
//   "name": "John",
//   "age": 30,
//   "city": "New York",
//   "isStudent": false,
//   "grades": [85, 90, 92]
// }

// jsonUser['name'] --> John
// jsonUser['']

// --> convert

// var reponse = UserModel.fromJson (jsonUser) --> dart
// response.name ; --> John

  Map<String, dynamic> toJson() {
    // Map Set dart : key : value
    // "name" : "John"
    // "name" : 12
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
// chua cai response ---> api tra ve chi thi chua trong file nay 