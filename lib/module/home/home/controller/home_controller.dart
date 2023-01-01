import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

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
