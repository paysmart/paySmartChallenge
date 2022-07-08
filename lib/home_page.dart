import 'package:flutter/material.dart';
import 'package:paysmartchallenge/utils/custom_text.dart';
import 'package:paysmartchallenge/widgets/top_rated_movies.dart';
import 'package:paysmartchallenge/widgets/trending.dart';
import 'package:paysmartchallenge/widgets/tv_popular.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvPopular = [];
  final String apikey = '94ed53e962867c88d74aa3ea4e67c6c1';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGVkNTNlOTYyODY3Yzg4ZDc0YWEzZWE0ZTY3YzZjMSIsInN1YiI6IjYyYmZmNjc3ZjFiNTcxMDA3YzlmYjk2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wKKN6hVgaOOLCg_aKEQjoEhCbK9q9JKI0wiD5mpZOGY';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingMovies = trendingresult['results'];
      topRatedMovies = topratedresult['results'];
      tvPopular = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: CustomText(
            text: "Cine paySmart",
            size: 40,
            color: Colors.yellow,
          ),
        ),
        body: ListView(
          children: [
            TrendingTitles(
              trending: trendingMovies,
            ),
            TopRatedMovies(
              toprated: topRatedMovies,
            ),
            TVPopular(tvPopular: tvPopular),
          ],
        ));
  }
}
