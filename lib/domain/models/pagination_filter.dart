class PaginationFilter {
  int? page;

  @override
  String toString() => 'PaginationFilter(page: $page)';

  @override
  bool operator ==(covariant PaginationFilter other) {
    if (identical(this, other)) return true;
  
    return 
      other.page == page;
  }

  @override
  int get hashCode => page.hashCode;
}
