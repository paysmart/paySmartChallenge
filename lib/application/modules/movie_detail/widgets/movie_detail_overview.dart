import 'package:flutter/material.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';

class MovieDetailOverview extends StatelessWidget {
  final MoviesDetailModel? movie;

  const MovieDetailOverview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movie?.overview ?? '',
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 14, height: 1.3),
        ),
      ),
    );
  }
}
