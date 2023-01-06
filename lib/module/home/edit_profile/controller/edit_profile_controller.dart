import 'package:flutter/material.dart';
import '/core.dart';

class EditProfileController extends State<EditProfileView>
    implements MvcController {
  static late EditProfileController instance;
  late EditProfileView view;

  String name = '', phoneNumber = '', photoUrl = '';

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  updateProfile() async {
    showLoading();

    if (name != '' && phoneNumber != '' && photoUrl != '') {
      try {
        await UserService.updateUser(
          name: name,
          phoneNumber: phoneNumber,
          photoUrl: photoUrl,
        );
        Get.back();
        Get.back();
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
