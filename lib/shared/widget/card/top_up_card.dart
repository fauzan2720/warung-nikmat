import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/core.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard(this.item, {super.key, this.isOrder = false});
  final Map<String, dynamic> item;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    String isDateFormat = isOrder
        ? DateFormat("H:m - dd MMM y")
            .format(DateTime.parse(item["updated_at"]))
        : DateFormat("H:m - dd MMM y")
            .format(DateTime.parse(item["created_at"]));

    return InkWell(
      onTap: () {
        if (isOrder) {
          Get.to(OrderDetailView(item, isAdmin: true));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: radiusPrimary,
          color: cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: whiteColor,
                        spreadRadius: 4.0,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: radiusPrimary,
                    image: DecorationImage(
                      image: NetworkImage(
                        "${item["user"]["photo"]}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width - 260.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '${item["user"]["name"]}',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: medium,
                            color: whiteColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      isOrder
                          ? "${item["quantity"]} menu | $isDateFormat"
                          : isDateFormat,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              isOrder
                  ? CurrencyFormat.convertToIdr(item["total_payment"], 2)
                  : CurrencyFormat.convertToIdr(item["point"], 2),
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
