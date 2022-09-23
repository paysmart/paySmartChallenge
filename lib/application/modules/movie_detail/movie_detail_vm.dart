import 'package:get/get.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';
import 'package:pay_smart_challenge/domain/services/movies/movies_services.dart';

abstract class IMovieDetailController {
  Future<void> getDetailMovies(int id);
}

class MovieDetailControllerVM extends GetxController
    implements IMovieDetailController {
  final IMoviesServices _moviesServices;

  final _movieDetail = MoviesDetailModel().obs;

  MoviesDetailModel get movieDetail => _movieDetail.value;

  MovieDetailControllerVM({required IMoviesServices moviesServices})
      : _moviesServices = moviesServices;

  @override
  Future<void> getDetailMovies(int id) async {
    final movieDetailData = await _moviesServices.getDetailMovies(id);
    _movieDetail.value = movieDetailData!;
  }
}
