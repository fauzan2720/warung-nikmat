import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

Widget filterChart(
  int index,
  String label,
) {
  return Flexible(
    flex: 1,
    child: InkWell(
      onTap: () => HomeAdminController.instance.handleFilterChart(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: radiusPrimary,
          color: index == HomeAdminController.instance.currentFilterChart
              ? yellowColor
              : Colors.transparent,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: whiteColor,
            fontWeight: medium,
          ),
        ),
      ),
    ),
  );
}
