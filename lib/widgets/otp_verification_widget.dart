import 'dart:ffi';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/screens/otp_verification_screen.dart';

import 'otp_widget.dart';

Widget otpVerificationWidget() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Grey Small Text
        Container(
          alignment: Alignment.bottomLeft,
          child: textCustom(text: 'Phone Verification', color: Colors.black),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: textCustom(
              text: 'Enter the 6-digit code sent to you at',
              color: Color.fromARGB(255, 107, 229, 215),
              fontSize: 14),
        ),

        //SPACING
        // const SizedBox(height: 33),
        //Bold Text
        Container(
          alignment: Alignment.bottomLeft,
          child: textCustom(
              text: 'Enter your OTP received ',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        /////////////////////////// OTP Box////////////////////////////
        Container(
          // width: Get.width,
          alignment: Alignment.center,

          child: RoundedWithCustomCursor(),
        ),

        //Bottom TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              children: [
                const TextSpan(text: 'Resend Code in '),
                TextSpan(
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  text: '10 seconds',
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
