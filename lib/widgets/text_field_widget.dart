import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';

class TextFieldWidget extends StatelessWidget {
  var title;
  IconData iconData;
  TextEditingController textEditingController;
  TextFieldWidget(
      {required this.title,
      required this.iconData,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textCustom(
          text: title,
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 7),
          width: Get.width,
          height: 55,
          //Box Decoration
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 3,
                  blurRadius: 3)
            ],
            borderRadius: BorderRadius.circular(8),
          ),

          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                iconData,
                color: Colors.cyan,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
