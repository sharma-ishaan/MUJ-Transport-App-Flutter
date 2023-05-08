import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class textCustom extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
  textCustom({
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      // textAlign: TextAlign.start,
    );
  }
}
