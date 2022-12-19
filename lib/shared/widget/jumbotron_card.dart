import 'package:flutter/material.dart';
import '/core.dart';

class JumbotronCard extends StatelessWidget {
  const JumbotronCard({
    super.key,
    this.onTap,
    required this.imageAsset,
  });
  final void Function()? onTap;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width - 40.0,
        height: 144.0,
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
