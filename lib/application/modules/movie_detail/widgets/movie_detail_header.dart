import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';

class MovieDetailHeader extends StatelessWidget {
  final MoviesDetailModel? movie;

  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;
    if (movieData != null) {
      return SizedBox(
        child: Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black54,
                Colors.black26,
                Colors.black12,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.2, 0.8, 1],
            ),
          ),
          height: 300,
          width: Get.width,
          child: movie?.posterPath == null
              ? const Center(child: CircularProgressIndicator())
              : Image.network(
                  movie!.posterPath!.isNotEmpty
                      ? 'https://image.tmdb.org/t/p/w500${movie!.posterPath}'
                      : 'https://i.ibb.co/3BYg6Pq/a-RFp-Bj-Cse-FD6-Umah-Au-Ldq-S7-Or5q.png',
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,
                ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
