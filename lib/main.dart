// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(HealthBmiCalculator());

class HealthBmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF090D22),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF090D22),
        )
      ),
      home: InputPage(),
    );
  }
}


