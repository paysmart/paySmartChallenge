import 'package:flutter/material.dart';
import 'package:paysmartchallenge/utils/custom_text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, vote, launch_on;
  final String? posterurl;

  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    this.posterurl,
    required this.vote,
    required this.launch_on,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: CustomText(
                      text: '⭐ Média de Avaliação - ' + vote,
                      size: 14,
                      color: Colors.white,
                    )),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child: CustomText(
                text: name != null ? name : 'Not Loaded',
                size: 24,
                color: Colors.yellow,
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: CustomText(
                text: 'Data de lançamento - ' + launch_on,
                size: 14,
                color: Colors.yellow,
              )),
          Row(
            children: [
              // Container(
              //   height: 200,
              //   width: 100,
              //   child: Image.network(posterurl),
              // ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: CustomText(
                        text: description, size: 18, color: Colors.white)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
