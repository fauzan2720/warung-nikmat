import 'package:flutter/material.dart';
import '/shared/util/style/border_radius.dart';
import '/shared/util/style/color.dart';
import '/shared/util/style/font_weight.dart';
import '/shared/util/style/size.dart';
import '../../../state_util.dart';

class FozWhiteButton extends StatelessWidget {
  const FozWhiteButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });
  final String label;
  final IconData? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: heightButton,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: radiusPrimary, // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: darkColor,
            fontWeight: medium,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
