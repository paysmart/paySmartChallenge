import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pay_smart_challenge/application/shared/helpers/genres_helper.dart';
import 'package:pay_smart_challenge/domain/models/movies_detail_model.dart';

class MovieDetailTitle extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/yyyy');
  final MoviesDetailModel? movie;

  MovieDetailTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.genres == null
                ? ''
                : movie?.genres!.map((e) => GenresHelper.getIdToGenreName(e.id)).join(', ') ?? '',
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          movie!.releaseDate != null
              ? Row(
                  children: [
                    SvgPicture.asset('assets/icons/calendar_blank.svg'),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      dateFormat.format(
                        DateTime.parse(
                          movie!.releaseDate!.toString(),
                        ),
                      ),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
