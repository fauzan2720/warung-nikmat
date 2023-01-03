import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  String email = 'warungnikmat@gmail.com', password = '123123123';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  doLoginAdmin() {
    if (email == 'warungnikmat@gmail.com') {
      if (password == '123123123') {
        Get.offAll(const HomeAdminView());
      } else {
        Get.showAlert("Oppsss", "Password salah");
      }
    } else {
      Get.showAlert("Oppsss", "Email salah");
    }
  }

  doLoginGoogle() async {
    Get.showLoading(primaryColor);

    if (await FirebaseAuthService().signInWithGoogle()) {
      await UserService.createUserIfNotExists();
      Get.offAll(const MainNavigationView());
    } else {
      Get.back();
      Get.showAlert("Oppsss", "Login gagal");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
