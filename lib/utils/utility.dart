import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static Future<void> launchURL(String url) async {
   await launchUrl(Uri.parse(url));
  }
}