import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({Key? key}) : super(key: key);

  Widget build(context, WishlistController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: WishlistService().wishlist.isEmpty
          ? const IsEmpty()
          : SingleChildScrollView(
              child: Container(
                padding: primarySize,
                child: Column(
                  children: WishlistService()
                      .wishlist
                      .map((product) => WishlistCard(product))
                      .toList(),
                ),
              ),
            ),
    );
  }

  @override
  State<WishlistView> createState() => WishlistController();
}
