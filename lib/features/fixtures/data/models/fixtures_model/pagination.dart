class Pagination {
  int? count;
  int? perPage;
  int? currentPage;
  dynamic nextPage;
  bool? hasMore;

  Pagination({
    this.count,
    this.perPage,
    this.currentPage,
    this.nextPage,
    this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        count: json['count'] as int?,
        perPage: json['per_page'] as int?,
        currentPage: json['current_page'] as int?,
        nextPage: json['next_page'] as dynamic,
        hasMore: json['has_more'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'per_page': perPage,
        'current_page': currentPage,
        'next_page': nextPage,
        'has_more': hasMore,
      };
}
