import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:warung_nikmat/core.dart';

class HomeAdminController extends State<HomeAdminView>
    implements MvcController {
  static late HomeAdminController instance;
  late HomeAdminView view;

  int currentFilterChart = 0;
  int currentFilter = 0;

  late TooltipBehavior tooltipBehavior;
  List<ChartData> chartData = ChartService.chart;

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

  void doLogout() {
    showConfirmation(onPressed: () {
      mainStorage.clear();
      Get.offAll(const SplashScreenView());
    });
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}
