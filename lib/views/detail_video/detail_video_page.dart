// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailVideoPage extends StatefulWidget {
  const DetailVideoPage({Key? key}) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Em desenvolvimento',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
