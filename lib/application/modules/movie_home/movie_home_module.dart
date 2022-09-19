import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pay_smart_challenge/application/modules/movie_home/movie_home_bindings.dart';
import 'package:pay_smart_challenge/application/modules/movie_home/movie_home_page.dart';
import 'package:pay_smart_challenge/application/shared/modules/module.dart';

class MovieHomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const MovieHomePage(),
      binding: MovieHomeBindings(),
    ),
  ];
}
