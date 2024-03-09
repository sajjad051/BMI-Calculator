import 'package:flutter/material.dart';

import 'constants.dart';
class BottomButtonPage extends StatelessWidget {

  final String buttonTitle;
  final VoidCallback onTap;

  const BottomButtonPage({super.key, required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
       // margin: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: kbottomContainerHeight,
        color: kbottomContainerColor,
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonTextStyle,
          ),
        ),
      ),
    )
    ;
  }
}
