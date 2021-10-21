import 'package:api_movie/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Movies> getMovies();
}
