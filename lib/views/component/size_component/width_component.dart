import 'package:flutter/material.dart';

class WidthComponent extends StatelessWidget {
  final double? width;

  const WidthComponent({
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 5.0,
    );
  }
}
