class ForgotPasswordRequest {
  final String username;
  final String email;

  ForgotPasswordRequest({
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}
