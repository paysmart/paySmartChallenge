import 'package:dio/native_imp.dart';

class RestClient extends DioForNative {
  RestClient() {
    options.baseUrl = 'https://api.themoviedb.org/3';
    options.connectTimeout = 60000;
    options.receiveTimeout = 60000;
    options.queryParameters = {
      'api_key': '719b76e0d247b50fa84916926fb1fe67',
    };
  }
}
