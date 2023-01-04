import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return SingleChildScrollView(
      child: Container(
        padding: primarySize,
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  size: 24.0,
                  color: secondaryColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  "Jl. Imam Sukari Mangli, Jember",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: semibold,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              "Silahkan nikmati hidangan yang dipilih secara khusus ini",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: semibold,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                FozPrimaryButton(
                  width: Get.width / 2 - heightButton - 3.0,
                  label: 'Makanan',
                  backgroundButton: controller.currentFilter == 0
                      ? yellowColor
                      : backgroundColor,
                  onPressed: () => controller.handleFilter(0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                FozPrimaryButton(
                  width: Get.width / 2 - heightButton - 3.0,
                  label: 'Minuman',
                  backgroundButton: controller.currentFilter == 1
                      ? yellowColor
                      : backgroundColor,
                  onPressed: () => controller.handleFilter(1),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  height: heightButton,
                  width: heightButton,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: cardColor,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_2_rounded,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            controller.currentFilter == 0
                ? StreamBuilder<List<ProductModel>>(
                    stream: ProductService().getProducts(type: "Makanan"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!
                              .map((product) => ProductCard(product))
                              .toList(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                : StreamBuilder<List<ProductModel>>(
                    stream: ProductService().getProducts(type: "Minuman"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data!
                              .map((product) => ProductCard(product))
                              .toList(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
