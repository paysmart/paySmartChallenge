import 'package:flutter/material.dart';

class HeightComponent extends StatelessWidget {
  final double? height;

  const HeightComponent({
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 5.0,
    );
  }
}
