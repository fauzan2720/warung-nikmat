import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class AddProductController extends State<AddProductView>
    implements MvcController {
  static late AddProductController instance;
  late AddProductView view;

  String name = '', price = '', type = '', photoUrl = '';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void addProduct() async {
    showLoading();

    if (name != '' && price != '' && type != '' && photoUrl != '') {
      try {
        await ProductService().addProduct(
          name: name,
          price: int.parse(price),
          type: type,
          photoUrl: photoUrl,
        );
        Get.offAll(const HomeAdminView());
        showSuccess();
      } catch (e) {
        Get.back();
        showAlert("Error", e.toString());
      }
    } else {
      Get.back();
      showAlert("Oppsss", "Ada inputan yang kosong");
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
