import 'package:flutter/material.dart';
import '/shared/util/style/border_radius.dart';
import '/shared/util/style/color.dart';
import '../../../state_util.dart';

class FozInputText extends StatelessWidget {
  const FozInputText({
    super.key,
    this.height,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines,
    this.width,
    required this.value,
    required this.onChanged,
  });

  final double? height;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? width;
  final String value;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: SizedBox(
        width: width ?? Get.width,
        child: TextFormField(
          style: TextStyle(color: secondaryColor),
          initialValue: value,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: prefixIcon != null
                ? const EdgeInsets.only(top: 14.0)
                : const EdgeInsets.all(18.0),
            filled: true,
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: suffixIcon,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusPrimarySize),
              borderSide: BorderSide(color: lightColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusPrimarySize),
              borderSide: BorderSide(color: strokeColor, width: 1.0),
            ),
            hoverColor: secondaryColor,
            hintStyle: TextStyle(color: strokeColor),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
