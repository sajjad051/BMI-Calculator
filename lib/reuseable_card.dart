import 'package:flutter/material.dart';

class ReUseableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onCardClick;
  ReUseableCard({required this.color, this.cardChild, this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)
        ),
        child: cardChild,
      ),
    );
  }
}