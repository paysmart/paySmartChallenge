import 'package:api_movie/models/movies_model.dart';
import 'package:api_movie/repository/movies_repository.dart';
import 'package:api_movie/services/dio_service.dart';
import 'package:api_movie/utils/api.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService);
  @override
  Future<Movies> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    //.get(API.REQUEST_MOVIE_LIST);

    return Movies.fromJson(result.data);
  }
}
