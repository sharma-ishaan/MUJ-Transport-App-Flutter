import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';

class AvailableCabScreenGPT extends StatefulWidget {
  // const AvailableCabScreen({super.key});
  const AvailableCabScreenGPT();
  @override
  State<AvailableCabScreenGPT> createState() => _AvailableCabScreenState();
}

class _AvailableCabScreenState extends State<AvailableCabScreenGPT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.png'),
            // fit: BoxFit.cover,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Container(
              child: const Card(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                shadowColor: Colors.black,
                elevation: 100,
                surfaceTintColor: Colors.amber,
                child: ListTile(
                  // leading: Icon(Icons.phone),
                  title: Text(
                    '+1 (123) 456-7890',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'johndoe@gmail.com',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
