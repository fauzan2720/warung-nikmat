import 'package:flutter/material.dart';
import '/shared/util/style/border_radius.dart';
import '/shared/util/style/color.dart';
import '/shared/util/style/font_weight.dart';
import '/shared/util/style/size.dart';
import '../../../../state_util.dart';

class FozOutlineSecondaryButton extends StatelessWidget {
  const FozOutlineSecondaryButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });
  final String label;
  final Widget? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: heightButton,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: radiusPrimary,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) SizedBox(child: icon),
            if (icon != null)
              const SizedBox(
                width: 8.0,
              ),
            Text(
              label,
              style: TextStyle(
                color: secondaryColor,
                fontWeight: medium,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
