class LocationRequest {
  final String? searchTerm;
  final int? pageSize;
  final int? pageIndex;
  final String? orderBy;
  final String? orderByDesc;
  final int? pageOffset;

  LocationRequest({
    this.searchTerm,
    this.pageSize,
    this.pageIndex,
    this.orderBy,
    this.orderByDesc,
    this.pageOffset,
  });

  Map<String, dynamic> toJson() {
    return {
      'searchTerm': searchTerm,
      'pageSize': pageSize,
      'pageIndex': pageIndex,
      'orderBy': orderBy,
      'orderByDesc': orderByDesc,
      'pageOffset': pageOffset,
    };
  }
}