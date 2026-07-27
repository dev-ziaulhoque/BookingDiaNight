import 'package:url_launcher/url_launcher.dart';

class MapHelper {
  static Future<void> openMap(double lat, double lng) async {
    final Uri googleUrl =
    Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');

    if (!await launchUrl(googleUrl, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $googleUrl');
    }
  }
}