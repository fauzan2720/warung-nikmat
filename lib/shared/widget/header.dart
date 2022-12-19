import 'package:flutter/material.dart';
import '/core.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.chevron_left,
              size: 24.0,
              color: darkColor,
            ),
          ),
          Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: medium,
                color: darkColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
