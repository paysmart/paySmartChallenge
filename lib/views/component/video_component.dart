import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_move/theme/app_typography.dart';
import 'package:cine_move/views/component/size_component/height_component.dart';
import 'package:flutter/material.dart';

class VideoComponent extends StatefulWidget {
  final List<String> imgList;
  final String? titleCategory;
  final String? title;
  final String? description;
  final Function onTap;

  const VideoComponent({
    required this.imgList,
    required this.titleCategory,
    required this.title,
    required this.description,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map(
          (item) => Stack(
            children: [
              Image.network(
                item,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
              Positioned(
                bottom: 0.0,
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title!,
                        style: titleVideoStyle,
                      ),
                      Text(
                        widget.description!,
                        style: descriptionStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();

    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.titleCategory!,
              style: titleCategoryStyle,
            ),
          ),
          const HeightComponent(),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
            ),
          )
        ],
      ),
      onTap: () => widget.onTap(),
    );
  }
}
