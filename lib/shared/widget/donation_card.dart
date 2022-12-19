import 'package:flutter/material.dart';
import '/core.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({
    super.key,
    required this.imageDonation,
    required this.label,
    required this.point,
  });
  final String imageDonation;
  final String label;
  final int point;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 180.0,
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        borderRadius: radiusPrimary,
        color: whiteColor,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: Image.asset(
                  imageDonation,
                  height: 120.0,
                  width: 280.0,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: light,
                    color: darkColor,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Text(
                  '$point Poin',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: semibold,
                    color: successColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
