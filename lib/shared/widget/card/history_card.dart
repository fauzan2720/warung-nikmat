import 'package:flutter/material.dart';
import '/core.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    // required this.history,
  });
  // final ProductModel history;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.to(HistoryDetailView(history: history)),
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
                      color: primaryColor,
                    ),
                    child: Text(
                      "Selesai",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: medium,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    "2 item",
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
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://portalmadura.com/wp-content/uploads/2020/03/geprek.jpg",
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
                              '{history.name}',
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
                            "{history.price} Point",
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