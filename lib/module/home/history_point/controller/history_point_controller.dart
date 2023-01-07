import 'package:flutter/material.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/history_point_view.dart';

class HistoryPointController extends State<HistoryPointView> implements MvcController {
  static late HistoryPointController instance;
  late HistoryPointView view;

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