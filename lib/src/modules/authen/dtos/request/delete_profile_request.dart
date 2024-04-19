class DeleteAccountRequest {
  final int userId;

  DeleteAccountRequest({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}