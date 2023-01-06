import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  int currentFilter = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void handleFilter(int index) {
    currentFilter = index;
    setState(() {});
  }

  scanQrCode() async {
    var qrCode = await showQrcodeScanner();
    var obj = jsonDecode(qrCode);

    showLoading();

    if (obj["point"] > 0) {
      await PointService.addPoint(
        point: double.parse("${obj["point"] ?? 0}"),
        userData: UserService.getUserData(),
      );

      Get.back();
      showSuccess(
          message:
              "${CurrencyFormat.convertToIdr(obj["point"], 2)} Poin berhasil ditambahkan!");
    } else {
      Get.back();
      showAlert("Maaf", "QR Code tidak ditemukan");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
