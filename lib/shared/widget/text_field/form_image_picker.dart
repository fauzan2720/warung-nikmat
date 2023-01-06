import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/core.dart';

class FozImagePicker extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final Function(String) onChanged;
  final String? provider;
  final bool gallery;

  const FozImagePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    required this.onChanged,
    this.obscure = false,
    this.provider = "cloudinary",
    this.gallery = false,
  }) : super(key: key);

  @override
  State<FozImagePicker> createState() => _FozImagePickerState();
}

class _FozImagePickerState extends State<FozImagePicker> {
  String? imageUrl;
  bool loading = false;
  late TextEditingController controller;

  @override
  void initState() {
    imageUrl = widget.value;
    controller = TextEditingController(
      text: widget.value ?? "-",
    );
    super.initState();
  }

  Future<String?> getFileMultiplePlatform() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
      ],
      allowMultiple: false,
    );
    if (result == null) return null;
    return result.files.first.path;
  }

  Future<String?> getFileAndroidIosAndWeb() async {
    XFile? image = await ImagePicker().pickImage(
      source: widget.gallery ? ImageSource.gallery : ImageSource.camera,
      imageQuality: 40,
    );
    String? filePath = image?.path;
    if (filePath == null) return null;
    return filePath;
  }

  Future<String?> uploadFile(String filePath) async {
    if (widget.provider == "cloudinary") {
      return await uploadToCloudinary(filePath);
    }
    return await uploadToImgBB(filePath);
  }

  Future<String> uploadToImgBB(String filePath) async {
    final formData = FormData.fromMap({
      'image': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
    });

    var res = await Dio().post(
      'https://api.imgbb.com/1/upload?key=b55ef3fd02b80ab180f284e479acd7c4',
      data: formData,
    );

    var data = res.data["data"];
    var url = data["url"];
    widget.onChanged(url);
    return url;
  }

  Future<String> uploadToCloudinary(String filePath) async {
    String cloudName = "dotz74j1p";
    String apiKey = "983354314759691";
    // String apiSecret = "pw3e4KZX9Y9qv0zv68voHUtXKvQ";

    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        File(filePath).readAsBytesSync(),
        filename: "upload.jpg",
      ),
      'upload_preset': 'yogjjkoh',
      'api_key': apiKey,
    });

    var res = await Dio().post(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      data: formData,
    );

    String url = res.data["secure_url"];
    return url;
  }

  browsePhoto() async {
    if (loading) return;

    String? filePath;
    loading = true;
    setState(() {});

    if (Platform.isWindows) {
      filePath = await getFileMultiplePlatform();
    } else {
      filePath = await getFileAndroidIosAndWeb();
    }
    if (filePath == null) return;

    imageUrl = await uploadFile(filePath);
    loading = false;

    if (imageUrl != null) {
      widget.onChanged(imageUrl!);
      controller.text = imageUrl!;
    }
    setState(() {});
  }

  String? get currentValue {
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
      decoration: BoxDecoration(
        borderRadius: radiusPrimary,
        border: Border.all(
          width: 1.0,
          color: strokeColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 72.0,
            width: 72.0,
            decoration: BoxDecoration(
              color: loading ? backgroundColor : null,
              image: loading
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                        imageUrl == null
                            ? "https://i.ibb.co/S32HNjD/no-image.jpg"
                            : imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Visibility(
              visible: loading == true,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: strokeColor,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      "Uploading...",
                      style: TextStyle(
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: FormField(
              initialValue: false,
              validator: (value) {
                return widget.validator!(imageUrl);
              },
              enabled: true,
              builder: (FormFieldState<bool> field) {
                return TextFormField(
                  controller: controller,
                  obscureText: widget.obscure,
                  readOnly: true,
                  style: TextStyle(color: secondaryColor),
                  decoration: InputDecoration(
                    labelText: widget.label,
                    labelStyle: TextStyle(
                      color: strokeColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: strokeColor,
                      ),
                    ),
                    suffixIcon: Transform.scale(
                      scale: 0.8,
                      child: SizedBox(
                        width: 80.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                loading ? Colors.grey[300] : primaryColor,
                          ),
                          onPressed: () => browsePhoto(),
                          child: const Text(
                            "Open",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    helperText: widget.hint,
                    errorText: field.errorText,
                  ),
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
