import 'dart:developer';
import 'package:pay_smart_challenge/application/shared/rest_client/rest_client.dart';
import 'package:pay_smart_challenge/core/exceptions/failure.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';
import 'package:pay_smart_challenge/domain/models/movies_model.dart';
import 'package:pay_smart_challenge/domain/models/pagination_filter.dart';

abstract class IMoviesRepository {
  Future<List<MoviesModel>> getUpcomingMovies(PaginationFilter filter);
  Future<MoviesDetailModel?> getDetailMovies(int id);
}

class MoviesRepositoryImpl implements IMoviesRepository {
  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<List<MoviesModel>> getUpcomingMovies(PaginationFilter filter) async {
    try {
      final response = await _restClient.get(
        '/movie/upcoming',
        queryParameters: {
          'language': 'pt-BR',
          'page': filter.page,
        },
      );
      final data = response.data['results'];
      if (data != null) {
        return data.map<MoviesModel>((v) => MoviesModel.fromMap(v)).toList();
      }
      return <MoviesModel>[];
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return throw Failure(message: 'Erro ao buscar lançamentos!');
    }
  }

  @override
  Future<MoviesDetailModel?> getDetailMovies(int id) async {
    try {
      final response = await _restClient.get(
        '/movie/$id',
        queryParameters: {
          'language': 'pt-br',
          'append_to_response': 'images,credits',
          'include_image_language': 'pt-br'
        },
      );
      return MoviesDetailModel.fromMap(response.data);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return throw Failure(message: 'Erro ao buscar detalhes do filme!');
    }
  }
}
