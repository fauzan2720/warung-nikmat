import 'package:flutter/material.dart';
import '/core.dart';

class FozMenuButton extends StatelessWidget {
  const FozMenuButton({
    super.key,
    this.icon,
    this.color,
    required this.label,
    required this.onTap,
  });
  final Widget? icon;
  final Color? color;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                child: icon,
              ),
              if (icon != null)
                const SizedBox(
                  width: 15.0,
                ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  color: color ?? secondaryColor,
                ),
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            size: 24.0,
            color: color ?? secondaryColor,
          ),
        ],
      ),
    );
  }
}
