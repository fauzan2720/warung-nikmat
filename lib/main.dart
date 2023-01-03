import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warung_nikmat/core.dart';

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
        appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuthService().authState,
        builder: (context, snapshot) {
          print('state: ${snapshot.connectionState} - ${snapshot.hasData}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitPouringHourGlass(
              color: primaryColor,
              duration: const Duration(milliseconds: 1200),
            );
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const MainNavigationView();
            } else {
              return const SplashScreenView();
            }
          } else {
            return Center(
              child: Text('State: ${snapshot.connectionState}'),
            );
          }
        },
      ),
    );
  }
}
