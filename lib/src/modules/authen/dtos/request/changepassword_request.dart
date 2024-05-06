class ChangePasswordRequest {
  String passwordOld;
  String passwordNew;

  ChangePasswordRequest({required this.passwordOld, required this.passwordNew});

  Map<String, dynamic> toJson() {
    return {
      'passwordOld': passwordOld,
      'passwordNew': passwordNew,
    };
  }
}
