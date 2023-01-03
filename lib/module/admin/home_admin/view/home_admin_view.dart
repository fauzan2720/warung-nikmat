import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:warung_nikmat/core.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({Key? key}) : super(key: key);

  Widget build(context, HomeAdminController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.pin_drop_outlined,
                        size: 24.0,
                        color: secondaryColor,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "Jl. Imam Sukari Mangli, Jember",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: semibold,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      bool confirm = false;
                      await showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Konfirmasi'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text('Apakah anda yakin ingin keluar ?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Tidak"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[700],
                                ),
                                onPressed: () {
                                  confirm = true;
                                  Navigator.pop(context);
                                },
                                child: const Text("Iya"),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm) {
                        Get.offAll(const SplashScreenView());
                      }
                    },
                    icon: const Icon(Icons.logout),
                    color: Colors.red[700],
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: radiusPrimary,
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    filterChart(0, "Minggu"),
                    filterChart(1, "Bulan"),
                    filterChart(2, "Tahun"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 250.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: radiusPrimary,
                  color: cardColor,
                ),
                child: SfCartesianChart(
                  title: ChartTitle(
                      text: 'Grafik Pembeli',
                      textStyle: TextStyle(
                        color: secondaryColor,
                        fontSize: 11.0,
                      )),
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: controller.tooltipBehavior,
                  series: <ChartSeries>[
                    SplineSeries<ChartData, String>(
                      dataSource: controller.chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      animationDuration: 4000,
                      color: whiteColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  menuButton("Tambah", Icons.add,
                      () => Get.to(const AddProductView())),
                  menuButton("Top Up", Icons.add_card, () {}),
                  menuButton("QR Code", Icons.qr_code_2, () {}),
                  menuButton("Riwayat", Icons.trending_up, () {}),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "Menu yang tersedia",
                style: TextStyle(
                    fontSize: 18.0, fontWeight: bold, color: whiteColor),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: FozPrimaryButton(
                      label: 'Makanan',
                      backgroundButton: controller.currentFilter == 0
                          ? yellowColor
                          : backgroundColor,
                      onPressed: () => controller.handleFilter(0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FozPrimaryButton(
                      label: 'Minuman',
                      backgroundButton: controller.currentFilter == 1
                          ? yellowColor
                          : backgroundColor,
                      onPressed: () => controller.handleFilter(1),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const ProductCard(isAdmin: true),
              const ProductCard(isAdmin: true),
              const ProductCard(isAdmin: true),
              const ProductCard(isAdmin: true),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeAdminView> createState() => HomeAdminController();
}
