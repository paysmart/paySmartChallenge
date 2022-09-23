import 'dart:developer';
import 'package:get/get.dart';
import 'package:pay_smart_challenge/domain/models/genre_model.dart';
import 'package:pay_smart_challenge/domain/models/movies_model.dart';
import 'package:pay_smart_challenge/domain/models/pagination_filter.dart';
import 'package:pay_smart_challenge/domain/services/movies/movies_services.dart';

abstract class IMovieHomeController {
  Future<void> getUpcomingMovies();
  void changePaginationFilter(int page);
  Future<void> nextPage();
  void filterMoviesByName(String title);
}

class MovieHomeControllerVM extends GetxController
    implements IMovieHomeController {
  MovieHomeControllerVM({
    required IMoviesServices moviesServices,
  }) : _moviesServices = moviesServices;

  final IMoviesServices _moviesServices;

  final _upcomingMoviesList = <MoviesModel>[].obs;
  final _upcomingMoviesListSearch = <MoviesModel>[];
  final _genres = <GenreModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;
  final _searching = false.obs;

  List<MoviesModel> get upcomingMoviesList => _upcomingMoviesList.toList();
  bool get lastPage => _lastPage.value;
  List<GenreModel> get genres => _genres.toList();
  bool get searching => _searching.value;

  @override
  void onInit() {
    super.onInit();
    changePaginationFilter(1);
  }

  @override
  Future<void> getUpcomingMovies() async {
    try {
      final listMovies =
          await _moviesServices.getUpcomingMovies(_paginationFilter.value);
      if (listMovies.isEmpty) {
        _lastPage.value = true;
      }

      _upcomingMoviesList.addAll(listMovies);
      _upcomingMoviesListSearch.addAll(listMovies);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void changePaginationFilter(int page) {
    _paginationFilter.value.page = page;
    getUpcomingMovies();
  }

  @override
  Future<void> nextPage() async {
    changePaginationFilter(_paginationFilter.value.page! + 1);
  }

  @override
  void filterMoviesByName(String title) {
    if (title.isNotEmpty) {
      var newListUpcomingMovies = _upcomingMoviesListSearch.where((m) {
        return m.title.toLowerCase().contains(title.toLowerCase());
      });

      newListUpcomingMovies.isEmpty
          ? _searching.value = true
          : _searching.value = false;

      _upcomingMoviesList.clear();
      _upcomingMoviesList.addAll(newListUpcomingMovies);
    } else {
      _upcomingMoviesList.clear();
      _upcomingMoviesList.addAll(_upcomingMoviesListSearch);
    }
  }
}
