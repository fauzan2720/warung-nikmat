import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '/core.dart';

void showSuccess() {
  Alert(
    context: Get.currentContext,
    type: AlertType.success,
    title: "Berhasil",
    buttons: [
      DialogButton(
        color: Colors.greenAccent[700],
        child: Text(
          "Oke",
          style: TextStyle(color: secondaryColor, fontSize: 14),
        ),
        onPressed: () => Get.back(),
      )
    ],
  ).show();
  return;
}
