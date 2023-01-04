import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/wishlist_view.dart';

class WishlistController extends State<WishlistView> implements MvcController {
  static late WishlistController instance;
  late WishlistView view;

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
