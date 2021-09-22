import 'package:bmi/NewWidget.dart';
import 'package:bmi/button.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result({required this.ans, required this.calcul, required this.inter});
  final String calcul;
  final String ans;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI')),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Your result is :',
                  style: TextStyle(fontSize: 25, color: Colors.white70),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 70),
                  child: NewWidget(
                    colours: colorCode,
                    cardType: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          calcul,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          ans,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          inter,
                          textAlign: TextAlign.center,
                          style: labelText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomButton(
                name: 'Back to calculation',
                tap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
