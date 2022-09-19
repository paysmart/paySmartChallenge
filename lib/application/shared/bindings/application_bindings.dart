import 'dart:developer';
import 'package:get/get.dart';
import 'package:pay_smart_challenge/application/shared/rest_client/rest_client.dart';
import 'package:pay_smart_challenge/data/repositories/movies/movies_repository.dart';
import 'package:pay_smart_challenge/domain/services/movies/movies_services.dart';

class ApplicationBindings implements Bindings {
  @override
  dependencies() {
    log('[ApplicationBindings] - Inicialized!');
    Get.put(RestClient(), permanent: true);
    Get.lazyPut<IMoviesRepository>(() => MoviesRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<IMoviesServices>(() => MoviesServicesImpl(moviesRepository: Get.find()));
  }
}
