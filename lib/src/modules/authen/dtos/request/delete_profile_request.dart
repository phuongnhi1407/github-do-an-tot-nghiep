class DeleteAccountRequest {
  final int id;
  final bool isSuperAdmin;

  DeleteAccountRequest({
    required this.id,
    required this.isSuperAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isSuperAdmin': isSuperAdmin,
    };
  }
}