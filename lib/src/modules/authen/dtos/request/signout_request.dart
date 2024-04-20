//LogoutRequest: Là lớp model đại diện cho request body của chức năng đăng xuất
class LogoutRequest {
  //Thuộc tính id: Được sử dụng để xác định người dùng cần đăng xuất.
  int id;

  LogoutRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}