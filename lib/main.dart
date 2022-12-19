import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warung_nikmat/module/splash_screen/view/splash_screen_view.dart';
import 'package:warung_nikmat/setup.dart';
import 'package:warung_nikmat/shared/util/style/color.dart';
import 'package:warung_nikmat/state_util.dart';

void main() async {
  await initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreenView(),
    );
  }
}
