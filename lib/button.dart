import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PressButton extends StatelessWidget {
  PressButton({required this.iconNam, required this.press});
  IconData iconNam;
  var press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconNam),
      onPressed: press,
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey[700],
    );
  }
}

// ignore: must_be_immutable
class BottomButton extends StatelessWidget {
  String name;
  var tap;
  BottomButton({required this.name, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.078,
        width: MediaQuery.of(context).size.width,
        color: Color(0XFFEB1555),
      ),
    );
  }
}
