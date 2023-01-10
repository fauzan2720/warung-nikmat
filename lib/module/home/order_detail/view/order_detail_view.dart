import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:warung_nikmat/core.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView(
    this.history, {
    Key? key,
    this.isAdmin = false,
    this.isPosAdmin = false,
  }) : super(key: key);
  final Map<String, dynamic> history;
  final bool isAdmin;
  final bool isPosAdmin;

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
                      isPosAdmin
                          ? "Tunjukkan QR Code ke Pembeli"
                          : isAdmin
                              ? "Pesanan ${history["user"]["name"]}"
                              : history["status"] == "Dalam Proses"
                                  ? "Tunjukkan QR Code ke Kasir"
                                  : history["status"] == "Ditolak"
                                      ? "Status pesanan kamu"
                                      : "Pesanan kamu sudah selesai",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: semibold,
                        color: secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      isAdmin || history["status"] == "Ditolak"
                          ? history["status"]
                          : history["status"] == "Dalam Proses"
                              ? "Menunggu Konfirmasi"
                              : "Terimakasih",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: extrabold,
                        color: history["status"] == "Ditolak"
                            ? Colors.red
                            : yellowColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    history["status"] == "Dalam Proses"
                        ? Container(
                            padding: const EdgeInsets.fromLTRB(
                                40.0, 0.0, 40.0, 20.0),
                            child: QrImage(
                              data: '${history["id"]}',
                              foregroundColor: secondaryColor,
                            ),
                          )
                        : Image.asset(
                            history["status"] == "Ditolak"
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
                            isAdmin || isPosAdmin
                                ? "Daftar pesanan"
                                : "Daftar pesanan kamu",
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
                    infoCart(
                      label: "Total Pesanan",
                      value: "${history["quantity"]}",
                    ),
                    infoCart(
                      label: "Total Harga",
                      value: CurrencyFormat.convertToIdr(
                          history["total_price"], 2),
                    ),
                    infoCart(
                      label: "Poin digunakan",
                      value:
                          "-${CurrencyFormat.convertToIdr(history["point_used"], 2)}",
                    ),
                    infoCart(
                      label: "Total Bayar (${history["payment_method"]})",
                      value: CurrencyFormat.convertToIdr(
                          history["total_payment"], 2),
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                label: "Kembali",
                onPressed: () => Get.back(),
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
