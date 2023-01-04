import 'package:flutter/material.dart';
import 'package:warung_nikmat/core.dart';

class EditProductController extends State<EditProductView>
    implements MvcController {
  static late EditProductController instance;
  late EditProductView view;

  String name = '', price = '', type = '', photoUrl = '';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  void editProduct(String id) async {
    showLoading();

    try {
      await ProductService().editProduct(
        id: id,
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
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
