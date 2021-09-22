import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class IconType extends StatelessWidget {
  final IconData icon;
  final String label;
  IconType({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelText,
        )
      ],
    );
  }
}
