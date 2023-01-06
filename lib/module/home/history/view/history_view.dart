import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';
import 'package:warung_nikmat/shared/widget/card/history_card.dart';
import 'package:warung_nikmat/shared/widget/is_empty.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  Widget build(context, HistoryController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: WishlistService().wishlist.isEmpty
          ? const IsEmpty()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  State<HistoryView> createState() => HistoryController();
}
