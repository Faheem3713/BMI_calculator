import 'package:bmi/button.dart';
import 'package:bmi/calculation.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'NewWidget.dart';
import 'iconType.dart';

class Jaba extends StatefulWidget {
  @override
  _JabaState createState() => _JabaState();
}

int age = 18;
int weight = 60;
int height = 180;
void clicks(int num) {
  if (num == 1) {
    if (maleClicked == colorCode) {
      maleClicked = clickColor;
      femaleClicked = colorCode;
    } else {
      maleClicked = colorCode;
    }
  } else if (num == 2) {
    if (femaleClicked == colorCode) {
      femaleClicked = clickColor;
      maleClicked = colorCode;
    } else {
      femaleClicked = colorCode;
    }
  }
}

class _JabaState extends State<Jaba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI',
            style: TextStyle(letterSpacing: 1),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        clicks(1);
                      });
                    },
                    child: NewWidget(
                      cardType:
                          IconType(icon: FontAwesomeIcons.mars, label: 'MALE'),
                      colours: maleClicked,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        clicks(2);
                      });
                    },
                    child: NewWidget(
                      cardType: IconType(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colours: femaleClicked,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: NewWidget(
              cardType: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: labelText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numText),
                      Text(
                        'cm',
                        style: labelText,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                      //  overlayColor: Color(0x173B0C20),
                        activeTrackColor: Color(0xFFEB1555),
                        inactiveTrackColor: Colors.grey[600],
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 18)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (newOne) {
                        setState(
                          () {
                            height = newOne.round();
                          },
                        );
                      },
                      min: 80,
                      max: 200,
                    ),
                  )
                ],
              ),
              colours: colorCode,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: NewWidget(
                    cardType: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelText,
                        ),
                        Text(weight.toString(), style: numText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PressButton(
                                iconNam: FontAwesomeIcons.minus,
                                press: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            PressButton(
                                iconNam: FontAwesomeIcons.plus,
                                press: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    colours: colorCode,
                  ),
                ),
                Expanded(
                  child: NewWidget(
                    cardType: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: labelText,
                        ),
                        Text(
                          age.toString(),
                          style: numText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PressButton(
                              iconNam: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PressButton(
                              iconNam: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    colours: colorCode,
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            name: 'CALCULATE',
            tap: () {
              Calculation calc = Calculation(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            ans: calc.calcuBMI(),
                            calcul: calc.getResult(),
                            inter: calc.interpretation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
