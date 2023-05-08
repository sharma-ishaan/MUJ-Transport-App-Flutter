import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/screens/otp_verification_screen.dart';

Widget loginTextWidget(CountryCode countryCode, Function onCountryPicker, Function onSubmit) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //WELCOME BACK
        textCustom(
            text: 'Welcome Back!', fontSize: 24, fontWeight: FontWeight.bold),
        //SPACING
        const SizedBox(height: 33),
        //Phone Number Text
        textCustom(text: 'Phone Number', color: Colors.grey),
        /////////////////////////// Phone Number Box////////////////////////////
        Container(
          margin: const EdgeInsets.symmetric(vertical: 7),
          width: double.infinity,
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
          child: Row(
            children: [
              const SizedBox(width: 10),
              //BOX 1 with country picker
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => onCountryPicker(),
                  child: Container(
                      child: Row(
                    children: [
                      Expanded(
                        child: Container(child: countryCode.flagImage),
                      ),
                      textCustom(text: countryCode.dialCode),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  )),
                ),
              ),
              //line in to separate the boxes
              Container(
                width: 1,
                height: 65,
                color: Colors.black26,
              ),
              //Box 2 with number input field
              Expanded(
                flex: 3,
                child: Container(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      onSubmitted:(String? input)=> onSubmit(input),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(fontSize: 12),
                        hintText: 'Enter Mobile Number',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        //Bottom TEXT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              children: [
                const TextSpan(
                    text: 'By creating an account, you agree to our '),
                TextSpan(
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  text: 'Terms of Service',
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  style: GoogleFonts.poppins( 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  text: 'Privacy Policy',
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
