import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '/core.dart';

void showMyQrCode(String label,
    {bool isTopUp = false, double nominal = 0}) async {
  await showDialog<void>(
    context: Get.currentContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(label)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              isTopUp
                  ? SizedBox(
                      width: Get.width / 1.5,
                      child: QrImage(data: '{"point": $nominal}'))
                  : Image.asset(getpoint),
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
            child: const Text("Kembali"),
          ),
        ],
      );
    },
  );
}
