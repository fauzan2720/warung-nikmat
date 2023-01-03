import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

BuildContext get globalContext {
  return Get.navigatorKey.currentContext!;
}

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentContext;
  }

  static to(Widget page) async {
    await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static put(Widget page) async {
    await navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static back() {
    // navigatorKey.currentState!.pop(currentContext);
    Navigator.pop(globalContext);
  }

  static offAll(page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.height;
  }

  static showLoading(Color color) async {
    return await showDialog<void>(
      context: currentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SpinKitPouringHourGlass(
          color: color,
          duration: const Duration(milliseconds: 1200),
        );
      },
    );
  }

  static showAlert(String title, String message) async {
    return await showDialog<void>(
      context: currentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  static showConfirmation({required void Function() onPressed}) async {
    bool confirm = false;
    await showDialog<void>(
      context: currentContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah anda yakin ?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
              ),
              onPressed: () {
                confirm = true;
                Navigator.pop(context);
              },
              child: const Text("Iya"),
            ),
          ],
        );
      },
    );

    if (confirm) {
      onPressed;
    }
  }
}

extension ChangeNotifierExtension on State {
  update() {
    // ignore: invalid_use_of_visible_for_testing_member, unnecessary_this, invalid_use_of_protected_member
    this.setState(() {});
  }
}

class MvcController {}
