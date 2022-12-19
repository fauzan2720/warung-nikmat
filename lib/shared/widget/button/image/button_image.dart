import 'package:flutter/material.dart';
import '/core.dart';

class FozWhiteButtonImage extends StatelessWidget {
  const FozWhiteButtonImage({
    super.key,
    required this.label,
    required this.imageAsset,
    this.icon,
    required this.onPressed,
  });
  final String label;
  final String imageAsset;
  final IconData? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: radiusPrimary, // <-- Radius
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 20,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              label,
              style: TextStyle(
                color: darkColor,
                fontWeight: medium,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
