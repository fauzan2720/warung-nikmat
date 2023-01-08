import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/history_admin_view.dart';

class HistoryAdminController extends State<HistoryAdminView> implements MvcController {
  static late HistoryAdminController instance;
  late HistoryAdminView view;

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