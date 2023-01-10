import 'package:flutter/material.dart';
import '/core.dart';

class NewOrderCard extends StatefulWidget {
  const NewOrderCard(this.item, {super.key});
  final Map<String, dynamic> item;

  @override
  State<NewOrderCard> createState() => _NewOrderCardState();
}

class _NewOrderCardState extends State<NewOrderCard> {
  @override
  Widget build(BuildContext context) {
    List listOrderData = widget.item["products"];

    Widget listOrder(Map itemOrder) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          '${itemOrder["quantity"]}x | ${itemOrder["name"]}',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: medium,
            color: whiteColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return InkWell(
      onTap: () {
        if (widget.item["user"]["name"] == "Kasir") {
          Get.to(OrderDetailView(widget.item, isPosAdmin: true));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: radiusPrimary,
          color: warningColor,
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
                        "${widget.item["user"]["photo"]}",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: listOrderData
                            .map((event) => listOrder(event))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Pembeli: ${widget.item["user"]["name"]}",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      "${widget.item["quantity"]} menu - terbayar ${CurrencyFormat.convertToIdr(widget.item["total_payment"], 2)} (${widget.item["payment_method"]})",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget.item["user"]["name"] == "Kasir"
                ? IconButton(
                    onPressed: () {
                      showLoading();
                      showConfirmation(onPressed: () async {
                        try {
                          await OrderService().deleteOrder(widget.item["id"]);
                          Get.back();
                          showSuccess();
                        } catch (e) {
                          Get.back();
                          showAlert("Error", e.toString());
                        }
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[500],
                    ),
                  )
                : Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          var qrCode = await showQrcodeScanner();

                          if (widget.item["id"] == qrCode) {
                            await OrderService()
                                .markAsDone("${widget.item["id"]}");
                            HomeAdminController.instance.setState(() {});
                            showSuccess(
                                message:
                                    "Pesanan $qrCode berhasil diselesaikan");
                          } else {
                            showAlert("Gagal", "QR Code tidak sesuai");
                          }
                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.green[400],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showConfirmation(
                            color: primaryColor,
                            onPressed: () async {
                              await OrderService()
                                  .markAsReject("${widget.item["id"]}");
                              HomeAdminController.instance.setState(() {});
                              showSuccess(
                                  message:
                                      "Pesanan ${widget.item["id"]} berhasil ditolak");
                            },
                          );
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.red[500],
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
