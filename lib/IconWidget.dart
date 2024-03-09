// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator_starter/constants.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const IconWidget({Key? key,
      required this.icon, this.color = Colors.white, required this.label}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
          icon,
          color: color,
          size: 80,
        ),
        SizedBox(height: 15.0,),
        Text(
          label,
          style: klabelTextStyle
        ),
      ],
    );
  }
}
