import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/cart_view.dart';

class CartController extends State<CartView> implements MvcController {
  static late CartController instance;
  late CartView view;

  double yourpoint = 0.0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
