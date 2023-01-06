import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class TopUpView extends StatefulWidget {
  const TopUpView({Key? key}) : super(key: key);

  Widget build(context, TopUpController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up Point User"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: primarySize,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: radiusPrimary,
          ),
          child: Column(
            children: [
              Text(
                "Pilih nominal:",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: medium,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(5000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(10000),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(15000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(20000),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(25000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(30000),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(40000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(50000),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(100000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(150000),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: nominalCard(200000),
                  ),
                  Flexible(
                    flex: 1,
                    child: nominalCard(500000),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.0,
        padding: primaryHorizontalSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Terima ${CurrencyFormat.convertToIdr(TopUpController.instance.nominal, 2)}',
              style: TextStyle(
                color: secondaryColor,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FozPrimaryButton(
              label: "Konfirmasi",
              onPressed: () => controller.confirmTopUp(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<TopUpView> createState() => TopUpController();
}
