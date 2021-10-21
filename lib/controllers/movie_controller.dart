import 'package:api_movie/models/movies_model.dart';
import 'package:api_movie/repository/movies_repository.dart';
import 'package:flutter/material.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  fetch() async {
    movies.value = await _moviesRepository.getMovies();
  }
}
