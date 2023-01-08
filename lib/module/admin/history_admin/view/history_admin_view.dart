import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warung_nikmat/core.dart';

class HistoryAdminView extends StatefulWidget {
  const HistoryAdminView({Key? key}) : super(key: key);

  Widget build(context, HistoryAdminController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Riwayat Pesanan"),
          bottom: TabBar(
            labelColor: secondaryColor,
            indicatorColor: strokeColor,
            labelStyle: GoogleFonts.poppins(),
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Pesanan Selesai"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.check,
                      size: 14.0,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Top Up"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      size: 14.0,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("orders")
                  .orderBy('updated_at', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (snapshot.data == null) return Container();
                if (snapshot.data!.docs.isEmpty) {
                  return const IsEmpty();
                }
                final data = snapshot.data!;

                return Padding(
                  padding: primarySize,
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);

                      return item["status"] == "Selesai"
                          ? TopUpCard(item, isOrder: true)
                          : const SizedBox();
                    },
                  ),
                );
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("points")
                  .orderBy('created_at', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (snapshot.data == null) return Container();
                if (snapshot.data!.docs.isEmpty) {
                  return const IsEmpty();
                }
                final data = snapshot.data!;
                return Padding(
                  padding: primarySize,
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      return item["point"] > 0
                          ? TopUpCard(item)
                          : const SizedBox();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<HistoryAdminView> createState() => HistoryAdminController();
}
