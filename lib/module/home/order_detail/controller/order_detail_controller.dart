import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/order_detail_view.dart';

class OrderDetailController extends State<OrderDetailView>
    implements MvcController {
  static late OrderDetailController instance;
  late OrderDetailView view;

  bool showTrash = true;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void handleShowTrash() {
    showTrash = !showTrash;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
