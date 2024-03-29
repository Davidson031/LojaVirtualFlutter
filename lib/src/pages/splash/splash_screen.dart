import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/app_name_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor[500]!,
              CustomColors.customSwatchColor[900]!,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              greentitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(height: 15),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
