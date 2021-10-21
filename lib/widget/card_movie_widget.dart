import 'package:api_movie/models/movies_model.dart';
import 'package:api_movie/pages/movie_details.dart';
import 'package:api_movie/utils/api.utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardMovieWidget extends StatelessWidget {
  final Movie movie;
  const CardMovieWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MovieDetails(movie: movie)),
          );
        },
        child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.black45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      API.REQUEST_IMAGE(movie.posterPath),
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return const CircularProgressIndicator.adaptive();
                      },
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(height: 4),
                        //INCOMPLETE
                        Text('Gender:' + movie.genreIds.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
