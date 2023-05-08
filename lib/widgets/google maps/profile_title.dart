import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileTitle() {
  return Container(
    height: Get.height * 0.15,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    alignment: Alignment.center,
    child: Row(children: [
      // const CircleAvatar(
      //   radius: 30,
      //   backgroundColor: Color.fromRGBO(107, 229, 215, 100),
      // ),
      const SizedBox(
        width: 70,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
              children: const [
                TextSpan(
                  text: 'Hello',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          const Text(
            "Where are you going today ?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ],
      )
    ]),
  );
}
