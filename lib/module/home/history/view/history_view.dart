import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warung_nikmat/core.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  Widget build(context, HistoryController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          actions: [
            IconButton(
              onPressed: () => Get.to(const HistoryPointView()),
              icon: Icon(
                Icons.monetization_on,
                color: secondaryColor,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
          ],
          bottom: TabBar(
            labelColor: secondaryColor,
            indicatorColor: strokeColor,
            labelStyle: GoogleFonts.poppins(),
            tabs: const [
              Tab(text: 'Dalam Proses'),
              Tab(text: 'Selesai'),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("orders").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("Error");
            if (snapshot.data == null) return Container();
            if (snapshot.data!.docs.isEmpty) {
              return const Text("No Data");
            }

            snapshot.data!.docs
                .toList()
                .sort((b, a) => a['updated_at']!.compareTo(b['updated_at']!));

            final data = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: data.docs.isEmpty
                  ? const IsEmpty()
                  : TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = (data.docs[index].data()
                                as Map<String, dynamic>);

                            return item["status"] == "Dalam Proses" &&
                                    item["user"]["id"] ==
                                        FirebaseAuth.instance.currentUser!.uid
                                ? HistoryCard(item)
                                : const SizedBox();
                          },
                        ),
                        ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = (data.docs[index].data()
                                as Map<String, dynamic>);

                            return item["status"] == "Selesai" &&
                                    item["user"]["id"] ==
                                        FirebaseAuth.instance.currentUser!.uid
                                ? HistoryCard(item)
                                : const SizedBox();
                          },
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  @override
  State<HistoryView> createState() => HistoryController();
}
