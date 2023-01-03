import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

Widget menuButton(
  String label,
  IconData iconData,
  void Function() onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 90.0,
      width: 85.0,
      decoration: BoxDecoration(
        borderRadius: radiusPrimary,
        color: cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: whiteColor,
            child: Icon(
              iconData,
              color: cardColor,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: semibold,
              color: whiteColor,
            ),
          ),
        ],
      ),
    ),
  );
}
