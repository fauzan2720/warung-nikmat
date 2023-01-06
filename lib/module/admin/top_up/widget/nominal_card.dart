import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

Widget nominalCard(int nominal) {
  return InkWell(
    onTap: () => TopUpController.instance.handleNominalCard(nominal),
    child: Card(
      color: TopUpController.instance.nominal == nominal.toDouble()
          ? whiteColor
          : cardColor,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          CurrencyFormat.convertToIdr(nominal.toDouble(), 2),
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: medium,
            color: TopUpController.instance.nominal == nominal.toDouble()
                ? cardColor
                : whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
