import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key, this.isAdmin = false}) : super(key: key);
  final bool isAdmin;

  Widget build(context, CartController controller) {
    controller.view = this;
    controller.paymentMethod = "Cash";
    controller.isAdmin = isAdmin;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: primarySize,
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
                height: 30.0,
              ),
              Column(
                children: CartService()
                    .cart
                    .map((product) => CartCard(product, isAdmin: isAdmin))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 269.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(radiusPrimarySize)),
          color: darkColor,
        ),
        child: Column(
          children: [
            FozFormDropdown(
              items: const ["Cash", "Debit", "OVO", "Dana", "Gopay"],
              onChanged: (value) {
                controller.paymentMethod = value;
              },
            ),
            infoCart(
              label: "Total Pesanan",
              value: "${CartService().totalQuantity()}",
            ),
            infoCart(
              label: "Total Harga",
              value:
                  CurrencyFormat.convertToIdr(CartService().totalPayment(), 2),
            ),
            if (isAdmin)
              Column(
                children: [
                  infoCart(
                    label: "Poin digunakan",
                    value:
                        "-${CurrencyFormat.convertToIdr(controller.yourpoint, 2)}",
                  ),
                  infoCart(
                    label: "Total Bayar",
                    value: CurrencyFormat.convertToIdr(
                        CartService().totalPayment() - controller.yourpoint, 2),
                    isTotal: true,
                  ),
                ],
              )
            else
              StreamBuilder<DocumentSnapshot<Object?>>(
                  stream: userCollection.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (!snapshot.hasData) return const Text("No Data");

                    Map<String, dynamic> item =
                        (snapshot.data!.data() as Map<String, dynamic>);
                    controller.getPoint(item["point"]);

                    return Column(
                      children: [
                        infoCart(
                          label: "Poin digunakan",
                          value:
                              "-${CurrencyFormat.convertToIdr(controller.yourpoint, 2)}",
                        ),
                        infoCart(
                          label: "Total Bayar",
                          value: CurrencyFormat.convertToIdr(
                              controller.totalPayment, 2),
                          isTotal: true,
                        ),
                      ],
                    );
                  }),
            const SizedBox(
              height: 5.0,
            ),
            FozPrimaryButton(
              label: 'Pesan Sekarang',
              onPressed: () => controller.orderNow(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CartView> createState() => CartController();
}
