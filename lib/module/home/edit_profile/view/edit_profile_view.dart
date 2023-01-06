import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/core.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  Widget build(context, EditProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perbarui Profile"),
        actions: [
          IconButton(
            onPressed: () => controller.updateProfile(),
            icon: const Icon(Icons.check),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot<Object?>>(
        stream: userCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Text("Error");
          if (!snapshot.hasData) return const Text("No Data");

          Map<String, dynamic> item =
              (snapshot.data!.data() as Map<String, dynamic>);

          controller.name = item["name"] ?? "";
          controller.phoneNumber = item["phone_number"] ?? "";
          controller.photoUrl =
              item["photo"] ?? "https://i.ibb.co/S32HNjD/no-image.jpg";

          return SingleChildScrollView(
            child: Container(
              padding: primarySize,
              child: Column(
                children: [
                  FozImagePicker(
                    gallery: true,
                    value: controller.photoUrl,
                    label: "Foto Profil",
                    onChanged: (value) {
                      controller.photoUrl = value;
                    },
                  ),
                  FozInputText(
                    value: controller.name,
                    hintText: "Nama",
                    onChanged: (value) {
                      controller.name = value;
                    },
                  ),
                  FozInputText(
                    value: controller.phoneNumber,
                    keyboardType: TextInputType.number,
                    hintText: "Nomor Telepon",
                    onChanged: (value) {
                      controller.phoneNumber = value;
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  State<EditProfileView> createState() => EditProfileController();
}
