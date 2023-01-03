import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class SplashScreenController extends State<SplashScreenView>
    implements MvcController {
  static late SplashScreenController instance;
  late SplashScreenView view;

  @override
  void initState() {
    instance = this;
    getInit();

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void getInit() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Get.put(const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
