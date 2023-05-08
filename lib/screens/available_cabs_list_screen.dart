import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/screens/booking_confirmation_screen.dart';
import 'package:taxi_app/widgets/CAB/cab_database.dart';
import 'package:taxi_app/widgets/CAB/cabs_list.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';

class AvailableCabsScreen extends StatelessWidget {
  // const AvailableCabsScreen({super.key});
  AvailableCabsScreen();
  final List<CabsData> _availableCabs = [
    CabsData(
      driverName: 'Ramesh',
      carName: 'Swift',
      phoneNumber: '9956498769',
      cost: 200,
      availableSeats: 4,
      vacantSeats: 3,
    ),
    CabsData(
        driverName: 'Suresh',
        carName: 'Alto',
        phoneNumber: '987654321',
        cost: 250,
        availableSeats: 4,
        vacantSeats: 3),
    CabsData(
        driverName: 'Mahesh',
        carName: 'Innova',
        phoneNumber: '8765410896',
        cost: 175,
        availableSeats: 6,
        vacantSeats: 6),
    CabsData(
        driverName: 'abc',
        carName: 'celerio',
        phoneNumber: '9876123450',
        cost: 205,
        availableSeats: 4,
        vacantSeats: 1),
    CabsData(
        driverName: 'Mukesh',
        carName: 'Innova',
        phoneNumber: '69875432160',
        cost: 180,
        availableSeats: 6,
        vacantSeats: 2),
    CabsData(
        driverName: 'Mukesh',
        carName: 'Innova',
        phoneNumber: '69875432160',
        cost: 180,
        availableSeats: 6,
        vacantSeats: 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            loginIntroWidget(),
            CabsList(_availableCabs),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 210,
        child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 107, 229, 215),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () => Get.to(() => BookingConfirmationScreen()),
            child: textCustom(
              text: 'CONFIRM BOOKING',
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
