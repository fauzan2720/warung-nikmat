import 'package:flutter/material.dart';
import '/core.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  Widget build(context, AddProductController controller) {
    controller.view = this;
    controller.type = "Makanan";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Menu"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              FozInputText(
                value: controller.name,
                onChanged: (value) {
                  controller.name = value;
                },
                hintText: "Nama Menu",
              ),
              FozInputText(
                value: controller.price,
                onChanged: (value) {
                  controller.price = value;
                },
                hintText: "Harga",
                keyboardType: TextInputType.number,
              ),
              FozFormDropdown(
                items: const ["Makanan", "Minuman"],
                onChanged: (value) {
                  controller.type = value;
                },
              ),
              FozImagePicker(
                gallery: true,
                label: 'Foto',
                onChanged: (value) {
                  controller.photoUrl = value;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                  label: 'Simpan', onPressed: () => controller.addProduct()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddProductView> createState() => AddProductController();
}
