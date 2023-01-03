import 'package:flutter/material.dart';
import '/core.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({Key? key}) : super(key: key);

  Widget build(context, AddProductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Menu"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: primarySize,
          child: Column(
            children: [
              FozInputText(
                value: '',
                onChanged: (value) {},
                hintText: "Nama Menu",
              ),
              FozInputText(
                value: '',
                onChanged: (value) {},
                hintText: "Harga",
              ),
              FozInputText(
                value: '',
                onChanged: (value) {},
                hintText: "Jenis Menu",
              ),
              FozImagePicker(
                label: 'Foto',
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(label: 'Simpan', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<AddProductView> createState() => AddProductController();
}
