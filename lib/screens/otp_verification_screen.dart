import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';
import 'package:taxi_app/Controller/auth_controller.dart';

import '../widgets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  String phoneNo;
  OtpVerificationScreen(this.phoneNo);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.phoneAuthentication(widget.phoneNo);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            loginIntroWidget(),
            Positioned(
              top: 45,
              left: 15,
              child: InkWell( 
                onTap: () => Get.back(),
                child: Container(
                  width: 30,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Color.fromARGB(255, 107, 229, 215),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        otpVerificationWidget(),
      ]),
    );
  }
}
