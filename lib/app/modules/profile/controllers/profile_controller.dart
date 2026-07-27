import 'package:bookdianight_app/app/core/utils/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // ডামি ইউজার ডাটা
  var userName = "Marvin McKinney".obs;
  var userEmail = "marvin@gmail.com".obs;
  var userPhone = "+1 213 555-0123".obs;
  var userLocation = "Rome, Italy".obs;

  var selectedLanguage = "English".obs;

  void logout() {
    CustomSnackBar.success(message: 'Logout success');
    Get.back();
    print("Logged out");
  }
}