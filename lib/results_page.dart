import 'package:bmi_calculator/bottombutton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPages extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPages(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Your Result",
              style: KTytleText,
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                Colour: kActiveCardColor,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: KResultText,
                    ),
                    Text(
                      bmiResult,
                      style: KBMIstyle,
                    ),
                    Text(
                      interpretation,
                      style: KBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'Re Calculate', onTap: (){
                Navigator.of(context).pop();
            },
            ),
          ],
        ));
  }
}
