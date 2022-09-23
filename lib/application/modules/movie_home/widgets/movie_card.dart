import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_smart_challenge/application/modules/movie_home/widgets/movie_info.dart';
import 'package:pay_smart_challenge/domain/models/movies_model.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/yyyy');
  MovieCard({Key? key, required this.movie}) : super(key: key);

  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed('/movie-detail', arguments: movie.id),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/calendar_blank.svg',
                      height: 12),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    movie.posterPath.isNotEmpty
                        ? 'https://image.tmdb.org/t/p/w200${movie.posterPath}'
                        : 'https://i.ibb.co/3BYg6Pq/a-RFp-Bj-Cse-FD6-Umah-Au-Ldq-S7-Or5q.png',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          Positioned(
            right: -10,
            top: -5,
            child: MovieInfo(
              movie: movie,
            ),
          )
        ],
      ),
    );
  }
}
