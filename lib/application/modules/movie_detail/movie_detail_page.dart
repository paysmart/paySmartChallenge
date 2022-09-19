import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/widgets/movie_detail_header.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/widgets/movie_detail_overview.dart';
import 'package:pay_smart_challenge/application/modules/movie_detail/widgets/movie_detail_title.dart';
import 'movie_detail_vm.dart';

class MovieDetailPage extends GetView<MovieDetailControllerVM> {
  MovieDetailPage({Key? key}) : super(key: key);

  final movieId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getDetailMovies(movieId);
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailHeader(
                movie: controller.movieDetail,
              ),
              MovieDetailTitle(
                movie: controller.movieDetail,
              ),
              MovieDetailOverview(
                movie: controller.movieDetail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
