import 'package:flutter/material.dart';

import 'constants.dart';


class IconContent extends StatelessWidget {
  IconContent({@required this.CardIcon, @required this.label});
  final IconData CardIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          CardIcon,
          size: 80,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelText,
        )
      ],
    );
  }
}
