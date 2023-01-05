import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  Widget build(context, CartController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: primarySize,
          child: Column(
            children: [
              // HEADER
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
                    .map((product) => CartCard(product))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 180.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(radiusPrimarySize)),
          color: darkColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pesanan",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: secondaryColor,
                  ),
                ),
                Text(
                  '${CartService().totalQuantity()}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bayar",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: secondaryColor,
                  ),
                ),
                Text(
                  CurrencyFormat.convertToIdr(CartService().totalPayment(), 2),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Poin Kamu",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: secondaryColor,
                  ),
                ),
                Text(
                  CurrencyFormat.convertToIdr(35110, 2),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: medium,
                    color: CartService().totalPayment() <= 35110
                        ? secondaryColor
                        : Colors.red[700],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            FozPrimaryButton(
              label: 'Pesan Sekarang',
              onPressed: () {
                if (CartService().totalPayment() <= 35110) {
                  print('execute this');
                } else {
                  showAlert("Oppsss", "Point anda tidak mencukupi");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CartView> createState() => CartController();
}
