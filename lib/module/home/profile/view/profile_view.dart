import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return SingleChildScrollView(
      child: Container(
        padding: primarySize,
        child: Column(
          children: [
            const HeaderApp(label: 'Profil Saya'),
            const SizedBox(
              height: 30.0,
            ),

            // MY PROFILE
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: radiusPrimary,
                color: cardColor,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      "${FirebaseAuthService().user.photoURL}",
                      width: 64.0,
                      height: 64.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${FirebaseAuthService().user.displayName}',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: semibold,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "0 Poin",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CONTAINER 1
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: radiusPrimary,
                color: cardColor,
              ),
              child: Column(
                children: [
                  FozMenuButton(
                    label: 'Lihat Profil',
                    onTap: () {},
                    icon: Icon(
                      Icons.person_outline,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Wishlist',
                    onTap: () => Get.to(const WishlistView()),
                    icon: Icon(
                      Icons.favorite_outline,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Lihat Pesanan',
                    onTap: () => Get.to(const HistoryView()),
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Hubungi Penjual',
                    onTap: () {},
                    icon: Icon(
                      Icons.call_outlined,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            // CONTAINER 2
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: radiusPrimary,
                color: cardColor,
              ),
              child: Column(
                children: [
                  FozMenuButton(
                    label: 'Pengaturan Akun',
                    onTap: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Syarat dan Ketentuan',
                    onTap: () {},
                    icon: Icon(
                      Icons.book_outlined,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Pusat Bantuan',
                    onTap: () {},
                    icon: Icon(
                      Icons.help_outline,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FozMenuButton(
                    label: 'Keluar',
                    onTap: () {
                      showConfirmation(onPressed: () {
                        mainStorage.clear();
                        FirebaseAuthService().signOut();
                        Get.offAll(const SplashScreenView());
                      });
                    },
                    color: Colors.red[300],
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.red[300],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
