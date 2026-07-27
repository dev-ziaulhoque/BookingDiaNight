import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());

  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get widthBox => SizedBox(width: toDouble());

  // Responsive (GetX দিয়ে)
  double get sh => Get.height * (toDouble() / 812);
  double get sw => Get.width * (toDouble() / 375);
}