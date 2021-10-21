import 'package:api_movie/services/dio_service.dart';
import 'package:dio/dio.dart';
//import 'package:dio/src/dio.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(BaseOptions(
        baseUrl:
            'https://api.themoviedb.org/3/movie/upcoming?api_key=0eb13382277307e297948e3dbecb7325',
        headers: {
          'content-type': 'application:json/charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZWIxMzM4MjI3NzMwN2UyOTc5NDhlM2RiZWNiNzMyNSIsInN1YiI6IjYxNjk4YTM2MTU4Yzg1MDA5NmI5ODc2NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BFCwipJrzUDgkcB1istUMv1Io5JqeH1xd-YnJmU6BmI',
        }));
  }
}
