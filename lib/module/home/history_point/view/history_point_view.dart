import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:warung_nikmat/core.dart';

class HistoryPointView extends StatefulWidget {
  const HistoryPointView({Key? key}) : super(key: key);

  Widget build(context, HistoryPointController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Riwayat Poin"),
          bottom: TabBar(
            labelColor: secondaryColor,
            indicatorColor: strokeColor,
            labelStyle: GoogleFonts.poppins(),
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Masuk"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.arrow_downward,
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
                    Text("Keluar"),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      size: 14.0,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
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
            return TabBarView(
              children: [
                Padding(
                  padding: primarySize,
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      return item["point"] > 0 &&
                              item["user"]["id"] ==
                                  FirebaseAuth.instance.currentUser!.uid
                          ? SingleChildScrollView(
                              controller: ScrollController(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat("H:m - dd MMM y").format(
                                          DateTime.parse(item["created_at"])),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: medium,
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      "+${CurrencyFormat.convertToIdr(item["point"], 2)}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: medium,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ),
                Padding(
                  padding: primarySize,
                  child: ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      return item["point"] < 0 &&
                              item["user"]["id"] ==
                                  FirebaseAuth.instance.currentUser!.uid
                          ? SingleChildScrollView(
                              controller: ScrollController(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat("H:m - dd MMM y").format(
                                          DateTime.parse(item["created_at"])),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: medium,
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      CurrencyFormat.convertToIdr(
                                          item["point"], 2),
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: medium,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  State<HistoryPointView> createState() => HistoryPointController();
}
