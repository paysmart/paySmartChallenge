import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, this.text, this.color, this.size})
      : super(key: key);
  final String? text;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: GoogleFonts.baloo2(color: color, fontSize: size));
  }
}
