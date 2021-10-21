class API {
  // ignore: non_constant_identifier_names
  static String REQUEST_IMAGE(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';

  // ignore: constant_identifier_names
  static const REQUEST_MOVIE_LIST = 'list/1?page=1';
}
