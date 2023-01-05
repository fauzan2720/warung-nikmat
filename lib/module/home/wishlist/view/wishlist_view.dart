import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  Widget build(context, WishlistController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              const HeaderApp(label: 'Wishlist'),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: FozPrimaryButton(
                      label: 'Makanan',
                      backgroundButton: controller.currentFilter == 0
                          ? yellowColor
                          : backgroundColor,
                      onPressed: () => controller.handleFilter(0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FozPrimaryButton(
                      label: 'Minuman',
                      backgroundButton: controller.currentFilter == 1
                          ? yellowColor
                          : backgroundColor,
                      onPressed: () => controller.handleFilter(1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              controller.currentFilter == 0
                  ? Column(
                      children: WishlistService()
                          .wishlist
                          .map((product) => product["type"] == "Makanan"
                              ? WishlistCard(product)
                              : const SizedBox())
                          .toList(),
                    )
                  : Column(
                      children: WishlistService()
                          .wishlist
                          .map((product) => product["type"] == "Minuman"
                              ? WishlistCard(product)
                              : const SizedBox())
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WishlistView> createState() => WishlistController();
}
