import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  // ==================== SCREEN SIZE ====================

  /// Screen width
  double get width => MediaQuery.sizeOf(this).width;

  /// Screen height
  double get height => MediaQuery.sizeOf(this).height;

  // ==================== DEVICE TYPE BREAKPOINTS ====================

  /// Is mobile device (< 600)
  bool get isMobile => width < 600;

  /// Is tablet device (>= 600 and < 1024)
  bool get isTablet => width >= 600 && width < 1024;

  /// Is desktop device (>= 1024)
  bool get isDesktop => width >= 1024;

  // ==================== ORIENTATION ====================

  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;

  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;
}