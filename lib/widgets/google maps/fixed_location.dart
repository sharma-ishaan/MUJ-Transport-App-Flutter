
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget manipalUniversityLOC() {
  return Container(
    // width: (MediaQuery.of(context).size.width),
    height: 50,
    padding: EdgeInsets.only(left: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 1)
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextFormField(
      readOnly: true,
      // onTap: () {
      //   showGooogleAutoComplete(context as BuildContext);
      // },
      style: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffA7A7A7)),
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(left: 20),
        hintText: 'Manipal University',
        hintStyle: GoogleFonts.poppins(fontSize: 16),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Icon(
            Icons.location_on_rounded,
            //color: AppColors.greenColor,
          ),
        ),
        border: InputBorder.none,
      ),
    ),
  );
}