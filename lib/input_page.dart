import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottombutton.dart';
import 'constants.dart';



enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//  Color maleCardColor = InActiveCardColor;
//  Color femaleCardColor = InActiveCardColor;

  Gender selectGender;
  int height = 180;
  int weight = 60;
  int age = 10;
//  void UpdateColor(Gender selectedGender) {
//    if (selectedGender == Gender.Male) {
//      if (maleCardColor == InActiveCardColor) {
//        maleCardColor = ActiveCardColor;
//        femaleCardColor = InActiveCardColor;
//        print("hello");
//      } else {
//        maleCardColor = InActiveCardColor;
//      }

//    }
//    if (selectedGender == Gender.Female) {
//      if (femaleCardColor == InActiveCardColor) {
//        femaleCardColor = ActiveCardColor;
//        maleCardColor = InActiveCardColor;
//        print("hello");
//      } else {
//        femaleCardColor = InActiveCardColor;
//      }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectGender = Gender.Male;
                        });
                      },
                      Colour: selectGender == Gender.Male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      CardChild: IconContent(
                        CardIcon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectGender = Gender.Female;
                        });
                      },
                      Colour: selectGender == Gender.Female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      CardChild: IconContent(
                        CardIcon: FontAwesomeIcons.venus,
                        label: 'Female',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                Colour: kActiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Height",
                      style: kLabelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: knumbertextstyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    Colour: kActiveCardColor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelText,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              click: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                click: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    Colour: kActiveCardColor,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelText,
                        ),
                        Text(
                          age.toString(),
                          style: knumbertextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              click: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                click: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "Calculate",

              onTap: () {
                CalculatorBrain calc = CalculatorBrain(weight:weight,height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPages(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}


class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({@required this.icon, @required this.click});
  final IconData icon;
  final Function click;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: click,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
    );
  }
}
