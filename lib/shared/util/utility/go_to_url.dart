import 'package:url_launcher/url_launcher.dart';

class GoToUrl {
  String phoneNumber = '6282338453446';

  Future<void> launcUrl(
    String url,
  ) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
