import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '/core.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
    this.product, {
    super.key,
    this.isAdmin = false,
  });
  final ProductModel product;
  final bool isAdmin;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
        endActionPane: widget.isAdmin
            ? ActionPane(
                extentRatio: widget.isAdmin ? 0.3 : 0.18,
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) =>
                        Get.to(EditProductView(widget.product)),
                    backgroundColor: warningColor,
                    foregroundColor: whiteColor,
                    icon: Icons.edit,
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(radiusPrimarySize),
                    ),
                    onPressed: (context) {
                      showConfirmation(onPressed: () async {
                        await ProductService()
                            .deleteProduct(id: widget.product.id!);
                        showSuccess();
                      });
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
                      WishlistService().addProduct(widget.product);
                      showSuccess();
                      setState(() {});
                    },
                    backgroundColor: yellowColor,
                    foregroundColor:
                        WishlistService().isWishlist(widget.product)
                            ? warningColor
                            : whiteColor,
                    icon: WishlistService().isWishlist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(radiusPrimarySize),
                      bottomRight: Radius.circular(radiusPrimarySize),
                    ),
                    onPressed: (context) {
                      CartService().addCart(
                        id: widget.product.id!,
                        name: widget.product.name!,
                        price: widget.product.price.toString(),
                        type: widget.product.type!,
                        photoUrl: widget.product.photoUrl!,
                      );
                      MainNavigationController.instance.setState(() {});
                      showSuccess();
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
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.product.photoUrl!,
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
                        widget.product.name!,
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
                        widget.product.type!,
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
                        CurrencyFormat.convertToIdr(widget.product.price, 2),
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
            ],
          ),
        ),
      ),
    );
  }
}
