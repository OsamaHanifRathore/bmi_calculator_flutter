
import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.onTap, @required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KLargeButtonText,
          ),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        color: kBottomButtonColor,
        height: KBottomContainerHeight,
      ),
    );
  }
}