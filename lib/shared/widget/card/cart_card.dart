import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '/core.dart';

class CartCard extends StatefulWidget {
  const CartCard(
    this.product, {
    super.key,
    this.isAdmin = false,
  });
  final dynamic product;
  final bool isAdmin;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        borderRadius: radiusPrimary,
        color: cardColor,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.18,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(radiusPrimarySize),
              ),
              onPressed: (context) {
                showConfirmation(onPressed: () {
                  CartService().removeCart(widget.product["id"]);
                  CartController.instance.setState(() {});
                  if (!widget.isAdmin) {
                    MainNavigationController.instance.setState(() {});
                  }
                  showSuccess();
                });
              },
              backgroundColor: yellowColor,
              foregroundColor: whiteColor,
              icon: Icons.delete_outline,
            ),
          ],
        ),
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: radiusPrimary,
            color: cardColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: whiteColor,
                          spreadRadius: 4.0,
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.product["photoUrl"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product["name"],
                        style: TextStyle(
                          fontWeight: semibold,
                          color: whiteColor,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        widget.product["type"],
                        style: TextStyle(
                          fontWeight: semibold,
                          fontSize: 12.0,
                          color: const Color(0xffA5A5BA),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(
                            int.parse(widget.product["price"]), 2),
                        style: TextStyle(
                          fontWeight: semibold,
                          color: warningColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      CartService().reduceQuantity(widget.product["id"]);
                      CartController.instance.setState(() {});
                      if (!widget.isAdmin) {
                        MainNavigationController.instance.setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: warningColor,
                      size: 32.0,
                    ),
                  ),
                  Text(
                    '${widget.product["quantity"]}',
                    style: TextStyle(
                      fontWeight: semibold,
                      color: secondaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      CartService().addQuantity(widget.product["id"]);
                      CartController.instance.setState(() {});
                      if (!widget.isAdmin) {
                        MainNavigationController.instance.setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: warningColor,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
