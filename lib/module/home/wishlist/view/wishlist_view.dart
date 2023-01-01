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
            children: const [
              HeaderApp(label: 'Wishlist'),
              SizedBox(
                height: 30.0,
              ),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WishlistView> createState() => WishlistController();
}
