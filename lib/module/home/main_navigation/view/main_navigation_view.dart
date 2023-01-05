import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () => Get.to(const CartView()),
        backgroundColor: lightColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fastfood,
              color: cardColor,
            ),
            Text(
              "+${CartService().totalQuantity()}",
              style: TextStyle(
                fontWeight: bold,
                color: cardColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(5),
        ),
        child: SizedBox(
          height: 80.0,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 6, // membuat margin
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: cardColor,
              currentIndex: controller.currentIndex,
              onTap: (value) => controller.onItemTapped(value),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: whiteColor,
              unselectedItemColor: lightColor,
              selectedLabelStyle: TextStyle(fontWeight: bold),
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Icon(Icons.home_outlined),
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Icon(Icons.history_outlined),
                  ),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Icon(Icons.favorite_border),
                  ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Icon(Icons.person_outline_rounded),
                  ),
                  label: 'Profil',
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: controller.widgetOptions.elementAt(controller.currentIndex),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
