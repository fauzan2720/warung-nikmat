import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class EditProductView extends StatefulWidget {
  const EditProductView(this.product, {Key? key}) : super(key: key);
  final ProductModel product;

  Widget build(context, EditProductController controller) {
    controller.view = this;
    controller.name = product.name!;
    controller.price = product.price.toString();
    controller.type = product.type!;
    controller.photoUrl = product.photoUrl!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Menu"),
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
                initialvalue: controller.type,
                items: const ["Makanan", "Minuman"],
                onChanged: (value) {
                  controller.type = value;
                },
              ),
              FozImagePicker(
                gallery: true,
                value: controller.photoUrl,
                label: 'Foto',
                onChanged: (value) {
                  controller.photoUrl = value;
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              FozPrimaryButton(
                  label: 'Simpan',
                  onPressed: () => controller.editProduct(product.id!)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<EditProductView> createState() => EditProductController();
}
