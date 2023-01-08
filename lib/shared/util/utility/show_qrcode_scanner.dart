import '/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

String? qrCode;
showQrcodeScanner() async {
  qrCode = null;
  await Get.to(const QrCodeScannerView());
  return qrCode;
}

class QrCodeScannerView extends StatefulWidget {
  const QrCodeScannerView({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerView> createState() => _QrCodeScannerViewState();
}

class _QrCodeScannerViewState extends State<QrCodeScannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan ke QR Code dikasir')),
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          qrCode = barcode.rawValue;
          if (qrCode != null) {
            print("YOUR QR CODE is $qrCode");
            Get.back();
          }
        },
      ),
    );
  }
}
