import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:warung_nikmat/state_util.dart';
import '../view/home_admin_view.dart';

class HomeAdminController extends State<HomeAdminView>
    implements MvcController {
  static late HomeAdminController instance;
  late HomeAdminView view;

  int currentFilterChart = 0;
  int currentFilter = 0;

  late TooltipBehavior tooltipBehavior;
  final List<ChartData> chartData = [
    ChartData('H-6', 22),
    ChartData('H-5', 17),
    ChartData('H-4', 30),
    ChartData('H-3', 8),
    ChartData('H-2', 23),
    ChartData('H-1', 16),
    ChartData('H', 18)
  ];

  void handleFilter(int index) {
    currentFilter = index;
    setState(() {});
  }

  @override
  void initState() {
    instance = this;
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void handleFilterChart(int index) {
    currentFilterChart = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}
