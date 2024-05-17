class ChangePasswordRequest {
  final String passwordOld;
  final String passwordNew;

  ChangePasswordRequest({
    required this.passwordOld,
    required this.passwordNew,
  });

  Map<String, dynamic> toJson() {
    return {
      'passwordOld': passwordOld,
      'passwordNew': passwordNew,
    };
  }
}
