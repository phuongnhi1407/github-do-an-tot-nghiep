class ActivateBikeRequest {
  final int bikeId;

  ActivateBikeRequest({required this.bikeId});

  Map<String, dynamic> toJson() {
    return {
      'bikeId': bikeId,
    };
  }
}