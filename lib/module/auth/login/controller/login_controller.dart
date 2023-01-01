import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  doLoginGoogle() async {
    var isSuccess = await AuthService.doLogin();
    if (isSuccess) {
      Get.offAll(const MainNavigationView());
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
