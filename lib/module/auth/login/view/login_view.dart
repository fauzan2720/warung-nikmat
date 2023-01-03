import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: primaryHorizontalSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mari Kita Mulai 😁",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: medium,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                "Skuyy login untuk menikmati menu-menu\nyang ada di restoran kami",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: medium,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40.0,
              ),
              FozInputText(
                value: controller.email,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              FozInputPassword(
                value: controller.password,
                hintText: 'Password',
                onChanged: (value) {
                  controller.password = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              FozPrimaryButton(
                label: 'Ayo Mulai',
                onPressed: () => controller.doLoginAdmin(),
              ),
              SizedBox(
                height: 80.0,
                child: Divider(color: strokeColor),
              ),
              FozOutlineSecondaryButton(
                label: 'Lanjutkan dengan Google',
                icon: Image.asset(
                  iconGoogle,
                  width: 24.0,
                ),
                onPressed: () => controller.doLoginGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
