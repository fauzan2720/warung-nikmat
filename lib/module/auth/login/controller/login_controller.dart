import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  String email = 'warungnikmat@gmail.com', password = '@warung.nikmat123';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  doLoginAdmin() {
    if (email == 'warungnikmat@gmail.com') {
      if (password == '@warung.nikmat123') {
        SessionManager().saveLogin();
        Get.offAll(const HomeAdminView());
      } else {
        showAlert("Oppsss", "Password salah");
      }
    } else {
      showAlert("Oppsss", "Email salah");
    }
  }

  doLoginGoogle() async {
    showLoading();

    if (await FirebaseAuthService().signInWithGoogle()) {
      await UserService.createUserIfNotExists();
      Get.offAll(const MainNavigationView());
    } else {
      Get.back();
      showAlert("Oppsss", "Login gagal");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
