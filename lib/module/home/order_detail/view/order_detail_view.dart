import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView(this.history, {Key? key, this.isAdmin = false})
      : super(key: key);
  final Map<String, dynamic> history;
  final bool isAdmin;

  Widget build(context, OrderDetailController controller) {
    controller.view = this;
    List listData = history["products"];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: radiusPrimary,
                        color: cardColor,
                      ),
                      child: Icon(Icons.chevron_left, color: secondaryColor),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Warung Nikmat",
                        style: TextStyle(
                          fontWeight: medium,
                          color: secondaryColor,
                        ),
                      ),
                      Text(
                        "Pesanan kamu",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: semibold,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: radiusPrimary,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      isAdmin
                          ? "Pesanan ${history["user"]["name"]}"
                          : history["status"] == "Dalam Proses"
                              ? "Pesanan kamu sedang diproses"
                              : "Pesanan kamu sudah selesai",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: semibold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      isAdmin
                          ? "Selesai"
                          : history["status"] == "Dalam Proses"
                              ? "Enjoy!"
                              : "Terimakasih",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: extrabold,
                        color: yellowColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Image.asset(
                      history["status"] == "Dalam Proses"
                          ? imageOrderProcess
                          : imageOrderSuccess,
                      width: Get.width,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: radiusPrimary,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => controller.handleShowTrash(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isAdmin ? "Daftar pesanan" : "Daftar pesanan kamu",
                            style: TextStyle(
                              fontWeight: semibold,
                              color: lightColor,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(
                            controller.showTrash
                                ? Icons.expand_less
                                : Icons.expand_more,
                            color: yellowColor,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        firstChild: const SizedBox(),
                        secondChild: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: listData
                                .map((history) => OrderCard(history))
                                .toList(),
                          ),
                        ),
                        crossFadeState: controller.showTrash
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),
                    ),
                    Divider(color: strokeColor, height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Pesanan",
                          style: TextStyle(
                            fontWeight: bold,
                            color: lightColor,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "${history["quantity"]}",
                          style: TextStyle(
                            fontWeight: extrabold,
                            color: whiteColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontWeight: bold,
                            color: lightColor,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                              history["total_payment"], 2),
                          style: TextStyle(
                            fontWeight: extrabold,
                            color: yellowColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                label: "Kembali",
                onPressed: () {
                  Get.back();
                  if (!isAdmin) {
                    MainNavigationController.instance.onItemTapped(1);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<OrderDetailView> createState() => OrderDetailController();
}
