import 'package:flutter/material.dart';
import '/core.dart';

Widget infoCart({
  required String label,
  required String value,
  bool isTotal = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: medium,
            color: secondaryColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: isTotal ? extrabold : medium,
            color: isTotal ? warningColor : secondaryColor,
          ),
        ),
      ],
    ),
  );
}
