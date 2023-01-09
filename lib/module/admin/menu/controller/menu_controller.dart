import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/menu_view.dart';

class MenuController extends State<MenuView> implements MvcController {
  static late MenuController instance;
  late MenuView view;

  int currentFilter = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void handleFilter(int index) {
    currentFilter = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
