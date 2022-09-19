import 'dart:convert';
import 'package:pay_smart_challenge/domain/models/genre_model.dart';

class MoviesDetailModel {
  MoviesDetailModel({
    this.title,
    this.genres,
    this.posterPath,
    this.releaseDate,
    this.overview,
  });
  final String? title;
  final List<GenreModel>? genres;
  final DateTime? releaseDate;
  final String? overview;
  final String? posterPath;
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'genres': genres?.map((x) => x.toMap()).toList(),
      'urlImages': posterPath,
      'releaseDate': releaseDate?.millisecondsSinceEpoch,
      'overview': overview,
    };
  }

  factory MoviesDetailModel.fromMap(Map<String, dynamic> map) {
    return MoviesDetailModel(
      title: map['title']  ?? '',
      genres: List<GenreModel>.from(
          map['genres']?.map((x) => GenreModel.fromMap(x)) ?? const []),
      posterPath: map['poster_path'] ?? '',
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] != null && map['overview'] != ''
          ? map['overview']
          : 'Filme sem descrição',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesDetailModel.fromJson(String source) =>
      MoviesDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
