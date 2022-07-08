import 'package:flutter/material.dart';
import 'package:paysmartchallenge/description.dart';
import 'package:paysmartchallenge/utils/custom_text.dart';

class TVPopular extends StatelessWidget {
  final List tvPopular;

  const TVPopular({Key? key, required this.tvPopular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Séries populares',
            size: 26,
            color: Colors.yellow,
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvPopular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: tvPopular[index]['name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              tvPopular[index]['backdrop_path'],
                                      description: tvPopular[index]['overview'],
                                      vote: tvPopular[index]['vote_average']
                                          .toString(),
                                      launch_on: tvPopular[index]
                                          ['first_air_date'],
                                    )));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvPopular[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: CustomText(
                                  size: 15,
                                  text: tvPopular[index]['name'] ??
                                      'Carregando...'),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
