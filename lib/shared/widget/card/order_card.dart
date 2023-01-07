import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(this.product, {super.key});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "${product["quantity"]}x",
                style: TextStyle(
                  fontWeight: semibold,
                  color: lightColor,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "${product["photoUrl"]}",
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "${product["name"]}",
                style: TextStyle(
                  fontWeight: semibold,
                  color: lightColor,
                ),
              ),
            ],
          ),
          Text(
            CurrencyFormat.convertToIdr(double.parse("${product["price"]}"), 2),
            style: TextStyle(
              fontWeight: semibold,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
