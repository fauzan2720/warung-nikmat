import 'package:flutter/material.dart';
import '/core.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
    this.history, {
    super.key,
  });
  final dynamic history;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(OrderDetailView(history)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: horizontalSize),
        decoration: BoxDecoration(
          borderRadius: radiusPrimary,
          border: Border.all(
            width: 1.0,
            color: strokeColor,
          ),
          color: cardColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 7.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: radiusPrimary,
                      color: history["status"] == "Selesai"
                          ? primaryColor
                          : warningColor,
                    ),
                    child: Text(
                      "${history["status"]}",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: medium,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    "${history["quantity"]} item",
                    style: TextStyle(
                      fontSize: 11.0,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: lightColor),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
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
                              "${history["products"][0]["photoUrl"]}",
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
                            width: Get.width - 280.0,
                            child: Text(
                              history["quantity"] > 1
                                  ? '${history["products"][0]["name"]}...'
                                  : '${history["products"][0]["name"]}',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: medium,
                                color: whiteColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            "${history["total_payment"]} Point",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
