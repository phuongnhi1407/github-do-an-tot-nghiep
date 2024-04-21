class LogoutRequest {
  int id;

  LogoutRequest({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
