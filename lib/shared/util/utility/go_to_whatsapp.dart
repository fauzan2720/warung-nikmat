import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class GoToWhatsApp {
  String phoneNumber = '6282338453446';

  Future<void> launchWhatsApp(
    String message,
  ) async {
    String url;
    if (Platform.isAndroid) {
      url = "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";
    } else if (Platform.isIOS) {
      url = "whatsapp://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}";
    } else {
      url =
          "https://api.whatsapp.com/send?phone=$phoneNumber=${Uri.parse(message)}";
    }

    print(url);

    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalNonBrowserApplication)) {
      throw 'Could not launch $url';
    }
  }
}
