import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loginIntroWidget() {
  return Container(
    height: Get.height * 0.3,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/Background.png'),
        fit: BoxFit.contain,
      ),
    ),
    child: Image.asset('assets/TITLE (1).png'),
  );
}
