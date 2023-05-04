import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';
import 'package:warung_nikmat/module/admin/menu/controller/menu_controller.dart'
    as menu;

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  Widget build(context, menu.MenuController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
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
                      onPressed: () => Get.to(const AddProductView()),
                      icon: Icon(
                        Icons.post_add,
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
                                .map((product) =>
                                    ProductCard(product, isAdmin: true))
                                .toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    )
                  : StreamBuilder<List<ProductModel>>(
                      stream: ProductService().getProducts(type: "Minuman"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!
                                .map((product) =>
                                    ProductCard(product, isAdmin: true))
                                .toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<MenuView> createState() => menu.MenuController();
}
