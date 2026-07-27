// lib/config/flavor_config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._();

  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  // Base URL
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static String get localBaseUrl => dotenv.env['LOCAL_BASE_URL']!;
  static String get socketUrl => dotenv.env['SOCEKT_URL']!;

  // API Keys
  static String get googleMapsKey => dotenv.env['MAP_API_KEY']!;

  // Helper
  static const bool isProduction = true;
  static const bool showDebugBanner = false;
}