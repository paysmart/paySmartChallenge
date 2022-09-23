import 'dart:convert';

class MoviesModel {
  MoviesModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.posterPath,
    required this.genres,
  });
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<dynamic> genres;
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'posterPath': posterPath,
      'genres': genres,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      releaseDate: map['release_date'] ?? '',
      posterPath: map['poster_path'] ?? '',
      genres: List<int>.from(map['genre_ids'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) =>
      MoviesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
