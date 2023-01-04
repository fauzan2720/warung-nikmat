import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/core.dart';

void showLoading() async {
  return await showDialog<void>(
    context: Get.currentContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SpinKitPouringHourGlass(
        color: primaryColor,
        duration: const Duration(milliseconds: 1200),
      );
    },
  );
}
