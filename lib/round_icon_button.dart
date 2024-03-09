import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Colors.grey,
        elevation: 0,
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
        ),
    );

  }
}
