import 'package:get/get.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/movie_detail_bindings.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/movie_detail_page.dart';
import 'package:pay_smart_challenge/application/shared/modules/module.dart';

class MovieDetailModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie-detail',
      page: () => MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),  
  ];
}