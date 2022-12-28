import 'package:flutter/material.dart';
import '../../config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {

  final Color? greentitleColor;
  final double textSize;

  const AppNameWidget({Key? key, this.greentitleColor, this.textSize=30.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(fontSize: textSize),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greentitleColor ?? CustomColors.customSwatchColor[900],
            ),
          ),
          TextSpan(
            text: 'Grocery',
            style: TextStyle(color: CustomColors.customContrastColor),
          ),
        ],
      ),
    );
  }
}
