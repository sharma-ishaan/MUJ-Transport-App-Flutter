import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/screens/available_cabs_list_screen.dart';
import 'package:taxi_app/widgets/login_intro_widget.dart';
import 'package:taxi_app/widgets/text_field_widget.dart';
import 'package:taxi_app/widgets/toggle_button.dart';

class profileRegistraionScreen extends StatefulWidget {
  const profileRegistraionScreen({super.key});

  @override
  State<profileRegistraionScreen> createState() =>
      _profileRegistraionScreenState();
}

class _profileRegistraionScreenState extends State<profileRegistraionScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeAdress = TextEditingController();
  TextEditingController registrationNo = TextEditingController();
  TextEditingController stream = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
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
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 143,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 32, 206, 206)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 50,
                          ),
                          Icon(
                            Icons.person_2_outlined,
                            color: Color.fromARGB(99, 245, 240, 240),
                            size: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToggleButtonsSample(),
                  TextFieldWidget(
                      title: 'Name',
                      iconData: Icons.person_2_outlined,
                      textEditingController: nameController),
                  TextFieldWidget(
                      title: 'Home Address',
                      iconData: Icons.home_outlined,
                      textEditingController: homeAdress),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 170,
        child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 107, 229, 215),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () => Get.to(() => AvailableCabsScreen()),
            child: textCustom(
              text: 'CREATE ID',
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
