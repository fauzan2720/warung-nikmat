import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class MainNavigationController extends State<MainNavigationView>
    implements MvcController {
  static late MainNavigationController instance;
  late MainNavigationView view;

  List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const HistoryView(),
    const WishlistView(),
    const ProfileView(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void onItemTapped(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
