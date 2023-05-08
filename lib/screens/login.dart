import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taxi_app/screens/otp_verification_screen.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';

import '../widgets/loginTextWidget.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      CountryCode(name: 'India', code: 'IN', dialCode: '+91');
  onSubmit(String? input) {
    Get.to(()=>OtpVerificationScreen(countryCode.dialCode+input!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loginIntroWidget(),
              const SizedBox(height: 30),
              loginTextWidget(countryCode, () async {
                // Show the country code picker when tapped.
                final code = await countryPicker.showPicker(context: context);
                // Null check
                if (code != null) countryCode = code;
                setState(() {});
              },onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
