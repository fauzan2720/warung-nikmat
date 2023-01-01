import 'package:flutter/material.dart';
import '/core.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    super.key,
    required this.label,
    this.isBackPressed = false,
  });
  final String label;
  final bool isBackPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Stack(
        children: [
          if (isBackPressed)
            InkWell(
              onTap: () => Get.back(),
              child: Icon(
                Icons.chevron_left,
                size: 24.0,
                color: secondaryColor,
              ),
            ),
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: semibold,
                color: secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
