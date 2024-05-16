class BikeStationRequest {
  String? searchTerm;
  int? pageSize;
  int? pageIndex;
  String? orderBy;
  String? orderByDesc;
  int? pageOffset;

  BikeStationRequest({
    this.searchTerm,
    this.pageSize,
    this.pageIndex,
    this.orderBy,
    this.orderByDesc,
    this.pageOffset,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (searchTerm != null) data['SearchTerm'] = searchTerm;
    if (pageSize != null) data['PageSize'] = pageSize;
    if (pageIndex != null) data['PageIndex'] = pageIndex;
    if (orderBy != null) data['OrderBy'] = orderBy;
    if (orderByDesc != null) data['OrderByDesc'] = orderByDesc;
    if (pageOffset != null) data['PageOffset'] = pageOffset;
    return data;
  }
}