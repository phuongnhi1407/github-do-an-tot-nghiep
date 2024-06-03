class ActivateBikeRequest {
  int? bikeId;

  ActivateBikeRequest({this.bikeId});

  Map<String, dynamic> toJson() {
    return {
      'bikeId': bikeId,
    };
  }
}