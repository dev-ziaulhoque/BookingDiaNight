// lib/core/utils/responsive.dart

import 'package:flutter/material.dart';

class AppResponsive {
  final BuildContext context;
  AppResponsive(this.context);

  static AppResponsive of(BuildContext context) => AppResponsive(context);

  double size(double mobile, {double? tablet, double? desktop}) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return desktop ?? tablet ?? mobile * 1.8;
    if (width >= 600) return tablet ?? mobile * 1.5;
    return mobile;
  }

  double mob(double value) => size(value);

  double mt(double mobile, double tablet) => size(mobile, tablet: tablet);

  double mtd(double mobile, double tablet, double desktop) =>
      size(mobile, tablet: tablet, desktop: desktop);

  double percentWidth(double percent) =>
      MediaQuery.of(context).size.width * (percent / 100);

  double percentHeight(double percent) =>
      MediaQuery.of(context).size.height * (percent / 100);

  double bottomPadding([double extra = 30]) =>
      MediaQuery.of(context).padding.bottom + extra;
}

extension ResponsiveExtension on BuildContext {
  AppResponsive get s => AppResponsive.of(this);
}

/*
// যেকোনো উইজেটের ভিতরে
Text(
  'SKATING WORLD',
  style: TextStyle(
    fontSize: context.s.mt(28, 48),        // মোবাইল ২৮, ট্যাবলেট ৪৮
  ),
),

Padding(
  padding: EdgeInsets.symmetric(
    horizontal: context.s.size(24, tablet: 80),   // মোবাইল ২৪, ট্যাব ৮০
  ),
  child: ...
),

SizedBox(
  height: context.s.mob(56),             // সব জায়গায় ৫৬ (অটো বড় হবে ট্যাবে)
),

// বাটনের নিচে নচের জন্য সেফ স্পেস
SizedBox(height: context.s.bottomPadding(40)),

// স্ক্রিনের ৯০% চওড়া কার্ড
width: context.s.percentWidth(90),

*/
