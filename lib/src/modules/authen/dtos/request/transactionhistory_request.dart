class TransactionHistoryRequest {
  int? userId;
  String? startDate;
  String? endDate;
  String? searchTerm;
  int? pageSize;
  int? pageIndex;
  String? orderBy;
  String? orderByDesc;
  int? pageOffset;

  TransactionHistoryRequest({
    this.userId,
    this.startDate,
    this.endDate,
    this.searchTerm,
    this.pageSize,
    this.pageIndex,
    this.orderBy,
    this.orderByDesc,
    this.pageOffset,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (userId != null) data['UserId'] = userId;
    if (startDate != null) data['StartDate'] = startDate;
    if (endDate != null) data['EndDate'] = endDate;
    if (searchTerm != null) data['SearchTerm'] = searchTerm;
    if (pageSize != null) data['PageSize'] = pageSize;
    if (pageIndex != null) data['PageIndex'] = pageIndex;
    if (orderBy != null) data['OrderBy'] = orderBy;
    if (orderByDesc != null) data['OrderByDesc'] = orderByDesc;
    if (pageOffset != null) data['PageOffset'] = pageOffset;
    return data;
  }
}