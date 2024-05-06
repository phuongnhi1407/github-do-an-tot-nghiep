class RequestParameters {
  int? userId;
  String? searchTerm;
  int? pageSize;
  int? pageIndex;
  String? orderBy;
  String? orderByDesc;
  int? pageOffset;

  RequestParameters({
    this.userId,
    this.searchTerm,
    this.pageSize,
    this.pageIndex,
    this.orderBy,
    this.orderByDesc,
    this.pageOffset,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['UserId'] = this.userId;
    data['SearchTerm'] = this.searchTerm;
    data['PageSize'] = this.pageSize;
    data['PageIndex'] = this.pageIndex;
    data['OrderBy'] = this.orderBy;
    data['OrderByDesc'] = this.orderByDesc;
    data['PageOffset'] = this.pageOffset;
    return data;
  }
}