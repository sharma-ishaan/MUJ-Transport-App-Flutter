// import 'dart:js';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/Customizations/TextCustomizations.dart';
import 'package:taxi_app/screens/available_cabs_list_screen.dart';
import 'package:taxi_app/screens/available_cabs_screen.dart';
import 'package:taxi_app/screens/login.dart';
import 'package:taxi_app/widgets/google%20maps/routes_declaration.dart';

import '../widgets/google maps/fixed_location.dart';
import '../widgets/google maps/profile_title.dart';

class MapScreen1 extends StatefulWidget {
  const MapScreen1({super.key});

  @override
  State<MapScreen1> createState() => _MapScreen1State();
}

class _MapScreen1State extends State<MapScreen1> {
  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
  late GoogleMapController newMapController;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final Set<Polyline> _polyline = {};

  final LatLng _center = const LatLng(26.845069105233208, 75.56530675925269);
  String? dropdownvalue = null;
  var myitems = ['WTP', 'Bus Stand', 'Airport', 'Railway Station'];
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(markerId: MarkerId('1'), position: LatLng(26.9124, 75.7873))
  ];
  void _onMapCreated(GoogleMapController controller) {
    newMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: ListView(
          children: [
            Container(
              height: 165,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/user_icon.png',
                      height: 65,
                      width: 50,
                    ),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textCustom(
                          text: 'Profile Name',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 6),
                        textCustom(
                          text: 'Visit Profile',
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            ListTile(
              leading: Icon(Icons.history),
              title: textCustom(
                text: 'Your Ride Details',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: textCustom(
                text: 'Visit Profile',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: textCustom(
                text: 'About',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            myLocationButtonEnabled: true,
            markers: Set<Marker>.of(_marker),
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newMapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          ),
          // SizedBox(
          //   height: 30,
          // ),

          Container(
            height: 240,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.5,
                  blurStyle: BlurStyle.outer,
                  blurRadius: 10,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 37,
                  left: 22,
                  child: GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 6,
                              offset: Offset(0.7, 0.7),
                            )
                          ]),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        radius: 20,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    profileTitle(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          manipalUniversityLOC(),
                          SizedBox(height: 10),
                          textField(
                              context), // todo: make the box borders circular just like the manipalUniversityLOC
                          // buildTextFieldSearch(),

                          // currentLocation(), // todo: Make the location work
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 270,
        child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 107, 229, 215),
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            onPressed: () => Get.to(() => loginScreen()),
            child: textCustom(
              text: 'CHECK AVAILABLE CABS',
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget textField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),

      color: Colors.white,
      // width: 150,

      // body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 80, 76, 76),
            ),
            focusColor: Colors.black,
            // Initial Value
            // borderRadius: BorderRadius.circular(20)
            //     .copyWith(topLeft: Radius.circular(0)),
            borderRadius: BorderRadius.circular(8),

            isExpanded: true,
            // dropdownColor: Color.fromARGB(255, 240, 238, 234),
            // hint: Text('ENter Your Destination', style: TextStyle(fontSize: 15)),
            value: dropdownvalue,

            // Down Arrow Icon

            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),

            // Array list of items
            items: myitems.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              },
            ).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
                // placeMarker(newValue);
                int i = myitems.indexOf(newValue);
                _marker.addAll(_list);
                print(i + 1);
              });
            },
            hint: Container(
              // width: 200, //and here
              child: Text(
                "Pick Your Destination",
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }

  // void drawPolyLine(int placeid) {
  //   _polyline.clear();
  //   _polyline.add(Polyline(
  //     polylineId: destination,
  //     visible: true,

  //     points: [_center, destination],
  //     // color: AppColors.greenColor,
  //     width: 5,
  //   ));
  // }
}

// Future<String> showGooogleAutoComplete(BuildContext context) async {
//   const kGoogleApiKey = "AIzaSyB5TkM6o8D8Gc2zNv0tZa6k31K8ZFQaHXY";

//   Prediction? p = await PlacesAutocomplete.show(
//       offset: 0,
//       radius: 1000,
//       strictbounds: false,
//       region: "us",
//       context: context,
//       apiKey: kGoogleApiKey,
//       mode: Mode.overlay, // Mode.fullscreen
//       language: "en",
//       types: ["(cities)"],
//       components: [new Component(Component.country, "us")]);

//   return p!.description!;
// }
//
Widget textFieldSearch() {
  //
  return Positioned(
    //
    top: 200, //
    left: 20, //
    right: 20, //
    child: Container(
      //
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
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        // readOnly: true,
        // onTap: () {
        //   showGooogleAutoComplete(context as BuildContext);
        // },
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7)),
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Search for your Destination',
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              //color: AppColors.greenColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget currentLocation() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 8),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blue,
        child: Icon(Icons.my_location, color: Colors.white),
      ),
    ),
  );
}

// placeMarker(String newValue) {
  // final List<RoutesDatabase> routes;
  // routes.forEach(['location']==newValue){};
//   Marker(markerId: MarkerId('2'), position: LatLng(routes, longitude)
//      // position: LatLng(
//       //   latitude: 0,
//       //   longitude: 0,
//       // ),
//       );
// }
// // import 'dart:js';
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:taxi_app/Customizations/TextCustomizations.dart';
// import 'package:taxi_app/screens/available_cabs_screen.dart';
// import 'package:taxi_app/widgets/google%20maps/routes_declaration.dart';

// import '../widgets/google maps/fixed_location.dart';
// import '../widgets/google maps/profile_title.dart';
// // import 'package:google_maps_webservice/places.dart';
// // import 'package:flutter_google_places/flutter_google_places.dart';
// // import 'package:flutter_google_places_autocomplete/flutter_google_places_autocomplete.dart';

// class MapScreen1 extends StatefulWidget {
//   const MapScreen1({super.key});

//   @override
//   State<MapScreen1> createState() => _MapScreen1State();
// }

// class _MapScreen1State extends State<MapScreen1> {
//   late GoogleMapController mapController;
//   final Set<Polyline> _polyline = {};

//   final LatLng _center = const LatLng(26.845069105233208, 75.56530675925269);
//   String? dropdownvalue = null;
//   var myitems = ['WTP', 'Bus Stand', 'Airport', 'Railway Station'];
//   // var Destinations [
//   //   (26.853193231724795, 75.80469023380044),
//   //   (26.853193231724795, 75.80469023380044),
//   //   (26.853193231724795, 75.80469023380044),
//   //   (26.853193231724795, 75.80469023380044),
//   // ];
//   List<Marker> _marker = [];
//   List<Marker> _list = const [
//     Marker(markerId: MarkerId('1'), position: LatLng(26.9124, 75.7873))
//   ];

//   // get destination => const LatLng(26.853193231724795, 75.80469023380044);
//   // String? selectedItem = null;
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             zoomControlsEnabled: true,
//             myLocationButtonEnabled: true,
//             markers: Set<Marker>.of(_marker),
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 15.0,
//             ),
//           ),
//           Column(
//             children: [
//               profileTitle(),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   children: [
//                     manipalUniversityLOC(),
//                     SizedBox(height: 10),
//                     textField(
//                         context), // todo: make the box borders circular just like the manipalUniversityLOC
//                     // buildTextFieldSearch(),

//                     // currentLocation(), // todo: Make the location work
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: SizedBox(
//         height: 40,
//         width: 270,
//         child: FloatingActionButton(
//             backgroundColor: Color.fromARGB(255, 107, 229, 215),
//             elevation: 10,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20))),
//             onPressed: () => Get.to(() => AvailableCabScreenGPT()),
//             child: textCustom(
//               text: 'CHECK AVAILABLE CABS',
//               color: Colors.white,
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//             )),
//       ),
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.miniCenterFloat,
//     );
//   }

//   Widget textField(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 15),

//       color: Colors.white,
//       // width: 150,

//       // body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           DropdownButton(
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Color.fromARGB(255, 80, 76, 76),
//             ),
//             focusColor: Colors.black,
//             // Initial Value
//             // borderRadius: BorderRadius.circular(20)
//             //     .copyWith(topLeft: Radius.circular(0)),
//             borderRadius: BorderRadius.circular(8),

//             isExpanded: true,
//             // dropdownColor: Color.fromARGB(255, 240, 238, 234),
//             // hint: Text('ENter Your Destination', style: TextStyle(fontSize: 15)),
//             value: dropdownvalue,

//             // Down Arrow Icon

//             icon: const Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//             ),

//             // Array list of items
//             items: myitems.map(
//               (String items) {
//                 return DropdownMenuItem(
//                   value: items,
//                   child: Text(items),
//                 );
//               },
//             ).toList(),
//             // After selecting the desired option,it will
//             // change button value to selected value
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownvalue = newValue!;
//                 // placeMarker(newValue);
//                 int i = myitems.indexOf(newValue);
//                 _marker.addAll(_list);
//                 print(i + 1);
//               });
//             },
//             hint: Container(
//               // width: 200, //and here
//               child: Text(
//                 "Pick Your Destination",
//                 textAlign: TextAlign.end,
//               ),
//             ),
//           ),
//         ],
//       ),
//       // ),
//     );
//   }

//   // void drawPolyLine(int placeid) {
//   //   _polyline.clear();
//   //   _polyline.add(Polyline(
//   //     polylineId: destination,
//   //     visible: true,

//   //     points: [_center, destination],
//   //     // color: AppColors.greenColor,
//   //     width: 5,
//   //   ));
//   // }
// }

// // Future<String> showGooogleAutoComplete(BuildContext context) async {
// //   const kGoogleApiKey = "AIzaSyB5TkM6o8D8Gc2zNv0tZa6k31K8ZFQaHXY";

// //   Prediction? p = await PlacesAutocomplete.show(
// //       offset: 0,
// //       radius: 1000,
// //       strictbounds: false,
// //       region: "us",
// //       context: context,
// //       apiKey: kGoogleApiKey,
// //       mode: Mode.overlay, // Mode.fullscreen
// //       language: "en",
// //       types: ["(cities)"],
// //       components: [new Component(Component.country, "us")]);

// //   return p!.description!;
// // }
// //
// Widget textFieldSearch() {
//   //
//   return Positioned(
//     //
//     top: 200, //
//     left: 20, //
//     right: 20, //
//     child: Container(
//       //
//       // width: (MediaQuery.of(context).size.width),
//       height: 50,
//       padding: EdgeInsets.only(left: 15),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 spreadRadius: 1,
//                 blurRadius: 1)
//           ],
//           borderRadius: BorderRadius.circular(8)),
//       child: TextFormField(
//         // readOnly: true,
//         // onTap: () {
//         //   showGooogleAutoComplete(context as BuildContext);
//         // },
//         style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Color(0xffA7A7A7)),
//         decoration: InputDecoration(
//           // contentPadding: EdgeInsets.only(left: 20),
//           hintText: 'Search for your Destination',
//           suffixIcon: Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Icon(
//               Icons.search,
//               //color: AppColors.greenColor,
//             ),
//           ),
//           border: InputBorder.none,
//         ),
//       ),
//     ),
//   );
// }

// Widget currentLocation() {
//   return Align(
//     alignment: Alignment.bottomRight,
//     child: Padding(
//       padding: const EdgeInsets.only(bottom: 8, right: 8),
//       child: CircleAvatar(
//         radius: 20,
//         backgroundColor: Colors.blue,
//         child: Icon(Icons.my_location, color: Colors.white),
//       ),
//     ),
//   );
// }

// // placeMarker(String newValue) {
//   // final List<RoutesDatabase> routes;
//   // routes.forEach(['location']==newValue){};
// //   Marker(markerId: MarkerId('2'), position: LatLng(routes, longitude)
// //      // position: LatLng(
// //       //   latitude: 0,
// //       //   longitude: 0,
// //       // ),
// //       );
// // }
