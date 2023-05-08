import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:taxi_app/widgets/CAB/cab_database.dart';

import '../../Customizations/TextCustomizations.dart';

class CabsList extends StatefulWidget {
  // const CabsList({super.key});
  final List<CabsData> cabs;
  CabsList(this.cabs);

  @override
  State<CabsList> createState() => _CabsListState();
}

class _CabsListState extends State<CabsList> {
  var _firstPress = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10, left: 7, right: 7, top: 10),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.6,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 5,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/images/user_icon.png',
                      height: 65,
                      width: 50,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textCustom(
                          text: widget.cabs[index].driverName,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textCustom(
                          text: widget.cabs[index].phoneNumber,
                          color: Colors.grey,
                        ),
                        textCustom(
                          text: ('Price per seat: ${widget.cabs[index].cost} '),
                        )
                      ],
                    ),
                    const SizedBox(width: 0),
                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        // height: Get.height,
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        setState(
                          () {
                            if (_firstPress) {
                              _firstPress = false;
                              if (widget.cabs[index].vacantSeats > 0)
                                widget.cabs[index].vacantSeats--;
                            }
                          },
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[300]),
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 4),
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     width: 2,
                          //     color: Color.fromARGB(255, 39, 176, 165),
                          //   ),
                          // ),
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textCustom(
                                text: "Car: ${widget.cabs[index].carName}",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textCustom(
                                  text:
                                      'Available Seats : ${widget.cabs[index].availableSeats}',
                                  color: Colors.white),
                              textCustom(
                                  text:
                                      'Vacant : ${widget.cabs[index].vacantSeats}',
                                  color: Colors.white)
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: widget.cabs.length,
      ),
    );
  }
}
