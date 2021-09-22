import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  final Color colours;
  final Widget cardType;
  NewWidget({
    required this.colours,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardType,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: colours, borderRadius: BorderRadius.circular(12)),
    );
  }
}
