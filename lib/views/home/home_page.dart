import 'package:cine_move/theme/app_colors.dart';
import 'package:cine_move/views/component/size_component/height_component.dart';
import 'package:cine_move/views/component/video_component.dart';
import 'package:cine_move/views/detail_video/detail_video_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cine Move',
          style: TextStyle(
            color: AppColors.primaryColor87,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor54,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.primaryColor87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const HeightComponent(
                height: 10,
              ),
              VideoComponent(
                titleCategory: 'Lançamento',
                title: 'South Park',
                description: 'Série animada que satiriza com muito humor ...',
                imgList: imgList,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailVideoPage(),
                    ),
                  );
                },
              ),
              const HeightComponent(
                height: 10,
              ),
              VideoComponent(
                  titleCategory: 'Ação',
                  title: 'Mercenários',
                  description: 'Os Mercenários é uma franquia americana de ...',
                  imgList: imgList,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailVideoPage(),
                      ),
                    );
                  }),
              const HeightComponent(
                height: 10,
              ),
              VideoComponent(
                  titleCategory: 'Aventura',
                  title: 'Mercenários',
                  description: 'Os Mercenários é uma franquia americana de ...',
                  imgList: imgList,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailVideoPage(),
                      ),
                    );
                  }),
              const HeightComponent(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
