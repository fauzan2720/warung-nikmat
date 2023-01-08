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

    return Container(
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
                    "${widget.item["quantity"]} menu - terbayar ${CurrencyFormat.convertToIdr(widget.item["total_payment"], 2)}",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showConfirmation(
                message: "Pesanan sudah siap ?",
                color: primaryColor,
                onPressed: () async {
                  await OrderService().markAsDone("${widget.item["id"]}");
                  HomeAdminController.instance.setState(() {});
                  showSuccess();
                },
              );
            },
            icon: Icon(
              Icons.check,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
