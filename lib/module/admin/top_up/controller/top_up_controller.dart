import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class TopUpController extends State<TopUpView> implements MvcController {
  static late TopUpController instance;
  late TopUpView view;

  double nominal = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void handleNominalCard(int nominalTopUp) {
    nominal = nominalTopUp.toDouble();
    setState(() {});
  }

  void confirmTopUp() async {
    if (nominal > 0) {
      showMyQrCode("Scan QR Code dibawah untuk top up",
          isTopUp: true, nominal: nominal);
    } else {
      showAlert("Oppsss", "Pilih nominal terlebih dahulu!");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
