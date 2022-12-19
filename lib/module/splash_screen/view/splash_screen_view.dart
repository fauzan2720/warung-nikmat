import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  Widget build(context, SplashScreenController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.only(left: 40.0, bottom: 45.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundSplashScreen),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Warung",
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: medium,
                  color: secondaryColor,
                ),
              ),
              Text(
                "Nikmat",
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: bold,
                  color: warningColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<SplashScreenView> createState() => SplashScreenController();
}
