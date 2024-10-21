class BasePaginationRequest {
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortField;
  final String? searchKeyword;
  final String? searchField;
  final String? status;

  BasePaginationRequest({
    this.page,
    this.limit,
    this.sortBy,
    this.sortField,
    this.searchKeyword,
    this.searchField,
    this.status,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'page_size': limit.toString(),
      if (sortBy != null) 'sort_by': sortBy,
      if (sortField != null) 'sort_field': sortField,
      if (searchKeyword != null) 'search_keyword': searchKeyword,
      if (searchField != null) 'search_field': searchField,
      if (status != null) 'status': status,
    };
    return data;
  }
}
