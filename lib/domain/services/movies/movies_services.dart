// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pay_smart_challenge/data/repositories/movies/movies_repository.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';
import 'package:pay_smart_challenge/domain/models/movies_model.dart';
import 'package:pay_smart_challenge/domain/models/pagination_filter.dart';

abstract class IMoviesServices {
  Future<List<MoviesModel>> getUpcomingMovies(PaginationFilter filter);
  Future<MoviesDetailModel?> getDetailMovies(int id);
}

class MoviesServicesImpl implements IMoviesServices {
  final IMoviesRepository _moviesRepository;

  MoviesServicesImpl({
    required IMoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MoviesModel>> getUpcomingMovies(PaginationFilter filter) =>
      _moviesRepository.getUpcomingMovies(filter);

  @override
  Future<MoviesDetailModel?> getDetailMovies(int id) =>
      _moviesRepository.getDetailMovies(id);
}
