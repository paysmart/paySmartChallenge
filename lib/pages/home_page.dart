import 'package:api_movie/controllers/movie_controller.dart';
import 'package:api_movie/models/movies_model.dart';
import 'package:api_movie/repository/movies_repository_imp.dart';
import 'package:api_movie/services/dio_service_imp.dart';
import 'package:api_movie/widget/card_movie_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller =
      MovieController(MoviesRepositoryImp(DioServiceImp()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Upcoming Movies',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                ValueListenableBuilder<Movies?>(
                    valueListenable: _controller.movies,
                    builder: (_, movies, __) {
                      return movies != null
                          ? ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: movies.listMovies.length,
                              itemBuilder: (_, idx) => CardMovieWidget(
                                  movie: movies.listMovies[idx]),
                              separatorBuilder: (_, __) => const Divider(),
                            )
                          : Container();
                    }),
              ],
            ),
          ),
        ));
  }
}
