class ActivateBikeResponse {
  final bool data;
  final String message;
  final int statusCode;

  ActivateBikeResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  factory ActivateBikeResponse.fromJson(Map<String, dynamic> json) {
    return ActivateBikeResponse(
      data: json['data'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}