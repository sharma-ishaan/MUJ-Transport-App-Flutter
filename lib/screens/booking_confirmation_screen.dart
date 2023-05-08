import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          loginIntroWidget(),
          textCustom(
            text: 'YOUR BOOKING IS CONFIRMED',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          Image.asset(
            'assets/images/cabmkc.png',
            height: 450,
          ),
        ],
      ),
    );
  }
}
