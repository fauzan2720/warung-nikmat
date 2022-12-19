import 'package:flutter/material.dart';
import '/core.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.to(const ProductDetailView()),
      child: Container(
        width: 118.0,
        margin: const EdgeInsets.only(right: 15.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: radiusPrimary,
          color: whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: radiusPrimary,
              child: Stack(
                children: [
                  Image.network(
                    "https://images.tokopedia.net/img/cache/500-square/product-1/2018/10/26/285788452/285788452_676a2e49-7507-4a02-9d2a-d3f52cd2107e_681_681.jpg",
                    width: 110.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                      onTap: (() {
                        isWishlist = !isWishlist;
                        setState(() {});
                      }),
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Image.asset(
                          isWishlist ? iconGoogle : iconGoogle,
                          width: 24.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 13.0,
            ),
            Text(
              "Bahan Daur Ulang Siap Pakai",
              style: TextStyle(
                  fontSize: 11.0, fontWeight: light, color: darkColor),
            ),
            const SizedBox(
              height: 11.0,
            ),
            Text(
              "25.500 Point",
              style: TextStyle(fontWeight: semibold, color: successColor),
            ),
          ],
        ),
      ),
    );
  }
}
