import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/add_product_view.dart';

class AddProductController extends State<AddProductView> implements MvcController {
  static late AddProductController instance;
  late AddProductView view;

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