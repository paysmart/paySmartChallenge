class Movies {
  Movies({
    required this.page,
    required this.listMovies,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Movie> listMovies;
  late final int totalPages;
  late final int totalResults;

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    listMovies =
        List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = listMovies.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Movie {
  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    //  required this.voteAverage,
  });
  late final String posterPath;
  late final bool adult;
  late final String overview;
  late final String releaseDate;
  late final List<int> genreIds;
  late final int id;
  late final String originalTitle;
  late final String originalLanguage;
  late final String title;
  late final String backdropPath;
  late final double popularity;
  late final int voteCount;
  late final bool video;

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['adult'] = adult;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_title'] = originalTitle;
    _data['original_language'] = originalLanguage;
    _data['title'] = title;
    _data['backdrop_path'] = backdropPath;
    _data['popularity'] = popularity;
    _data['vote_count'] = voteCount;
    _data['video'] = video;
    return _data;
  }
}
