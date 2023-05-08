import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Widget> gender = <Widget>[
  Text('Male'),
  Text('Female'),
];

class ToggleButtonsSample extends StatefulWidget {
  
  ToggleButtonsSample();

  @override
  State<ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<ToggleButtonsSample> {
  final List<bool> _selectedgender = <bool>[true, false];
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('Gender',
            //     style: GoogleFonts.poppins(
            //       color: Colors.grey,
            //       fontSize: 14,
            //       fontWeight: FontWeight.bold,
            //     )),
            const SizedBox(height: 5),
            ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedgender.length; i++) {
                    _selectedgender[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: const Color.fromARGB(211, 107, 229, 215),
              selectedColor: Colors.white,
              fillColor: const Color.fromARGB(255, 136, 223, 213),
              color: const Color.fromARGB(255, 54, 218, 198),
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedgender,
              children: gender,
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
