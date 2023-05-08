import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoutesDatabase extends StatelessWidget {
  // const RoutesDatabase({super.key});
  final _routes = const [
    {
      'location': 'WTP',
      'name': 'Ramesh',
      'coords': {
        'lat': 26.8534,
        'lng': 75.8051,
      },
    },
    {
      'location': 'Sindhi Camp',
      'coords': {
        'lat': 26.9264585,
        'lng': 75.7988863,
      },
    },
    {
      'location': 'Airport',
      'coords': {
        'lat': 26.8289,
        'lng': 75.8056,
      },
    },
    {
      'location': 'Jaipur Junction',
      'coords': {
        'lat': 26.9196,
        'lng': 75.7880,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
