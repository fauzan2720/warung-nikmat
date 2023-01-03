import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '/core.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    this.isCart = false,
    this.isAdmin = false,
  });
  final bool isCart;
  final bool isAdmin;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishlist = false;

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
        endActionPane: widget.isCart || widget.isAdmin
            ? ActionPane(
                extentRatio: widget.isAdmin ? 0.3 : 0.18,
                motion: const StretchMotion(),
                children: [
                  if (widget.isAdmin)
                    SlidableAction(
                      onPressed: (context) {
                        print('Edit OK!');
                      },
                      backgroundColor: warningColor,
                      foregroundColor: whiteColor,
                      icon: Icons.edit,
                    ),
                  SlidableAction(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(radiusPrimarySize),
                    ),
                    onPressed: (context) {
                      print('Delete OK!');
                    },
                    backgroundColor: yellowColor,
                    foregroundColor: whiteColor,
                    icon: Icons.delete_outline,
                  ),
                ],
              )
            : ActionPane(
                extentRatio: 0.3,
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      print('Favorite OK!');
                    },
                    backgroundColor: yellowColor,
                    foregroundColor: whiteColor,
                    icon: Icons.favorite_border,
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(radiusPrimarySize),
                      bottomRight: Radius.circular(radiusPrimarySize),
                    ),
                    onPressed: (context) {
                      print('Add to Cart OK!');
                    },
                    backgroundColor: warningColor,
                    foregroundColor: whiteColor,
                    icon: Icons.add_circle_outline,
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
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://sweetrip.id/wp-content/uploads/2021/03/adisdermawan_152452974_546949496189026_1105602456210071800_n.jpg",
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
                        "Ayam Geprek",
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
                        "14 orang telah makan ini",
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
                        CurrencyFormat.convertToIdr(8000, 2),
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
              widget.isCart
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle,
                            color: warningColor,
                            size: 32.0,
                          ),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                            fontWeight: semibold,
                            color: secondaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: warningColor,
                            size: 32.0,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
