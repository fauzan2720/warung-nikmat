import 'package:flutter/material.dart';
import '/core.dart';

void showConfirmation({
  required void Function() onPressed,
  Color? color,
}) async {
  bool confirm = false;
  await showDialog<void>(
    context: Get.currentContext,
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
              backgroundColor: color ?? Colors.red[700],
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
    onPressed();
  }
}
