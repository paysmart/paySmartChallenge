import 'package:api_movie/models/movies_model.dart';
import 'package:api_movie/utils/api.utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              API.REQUEST_IMAGE(movie.backdropPath),
              loadingBuilder: (_, child, progress) {
                if (progress == null) return child;
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: Text(
              movie.overview,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Release date: ' +
                DateFormat.yMMMMd()
                    .format(DateTime.parse(movie.releaseDate))
                    .toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
