import 'package:flutter/material.dart';
import 'package:pay_smart_challenge/application/shared/helpers/genres_helper.dart';
import 'package:pay_smart_challenge/domain/models/movies_model.dart';

class MovieInfo extends StatelessWidget {
  MovieInfo({required this.movie, Key? key}) : super(key: key);
  final MoviesModel movie;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tooltip(
          key: tooltipkey,
          triggerMode: TooltipTriggerMode.manual,
          showDuration: const Duration(seconds: 1),
          message: movie.genres
              .map((e) => GenresHelper.getIdToGenreName(e))
              .toString(),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => tooltipkey.currentState?.ensureTooltipVisible(),
            icon: const Icon(
              Icons.info_sharp,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset.zero,
                  blurRadius: 15,
                ),
              ],
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
