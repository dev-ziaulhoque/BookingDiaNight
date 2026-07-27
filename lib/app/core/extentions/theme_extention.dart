// lib/app/core/theme/theme_extensions.dart

import 'package:flutter/material.dart';

import '../resources/app_colors/app_colors.dart';


extension ThemeExtension on BuildContext {
  // ==================== THEME INFO ====================

  /// Get current theme data
  ThemeData get theme => Theme.of(this);

  /// Get color scheme
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Get text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Check if light mode
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  // ==================== COLORS ====================

  /// Primary color
  Color get primaryColor => AppColors.primaryColor(this);

  /// Background color
  Color get bgColor => AppColors.backgroundColor(this);

  /// Surface color
  Color get surfaceColor => AppColors.surfaceColor(this);

  /// Card color
  Color get cardColor => AppColors.cardColor(this);
  Color get secondaryCardColor => AppColors.secondaryCardColor(this);

  /// Text color
  Color get textColor => AppColors.textColor(this);
  Color get secondaryTextColor => AppColors.secondaryTextColor(this);

  /// Text color
  Color get subtitleTextColor => AppColors.subtitleColor(this);

  /// inputColor color
  Color get inputColor => AppColors.inputColor(this);

  /// Secondary text color
  Color get textSecondary => AppColors.textSecondaryColor(this);

  /// Border color
  Color get borderColor => AppColors.borderColor(this);

  /// Divider color
  Color get dividerColor => AppColors.dividerColor(this);

  /// Icon color
  Color get iconColor => AppColors.iconColor(this);

  /// Hover color
  Color get hoverColor => AppColors.hoverColor(this);

  // ==================== GRADIENTS ====================

  /// Primary gradient
  LinearGradient get primaryGradient => AppColors.primaryGradient(this);

  /// Card gradient
  LinearGradient get cardGradient => AppColors.cardGradient(this);

  /// Button gradient
  LinearGradient get buttonGradient => AppColors.buttonGradient(this);
  LinearGradient get navbarGradient => AppColors.navBarGradient(this);
  LinearGradient get secondaryButtonGradient => AppColors.secondaryButtonGradient(this);
  LinearGradient get textGradient => AppColors.textGradient(this);

  LinearGradient get borderGradient => AppColors.borderGradient(this);

  /// Hero gradient
  RadialGradient get heroGradient => AppColors.heroGradient(this);

  /// Success gradient
  LinearGradient get successGradient => AppColors.successGradient(this);

  /// Overlay gradient
  LinearGradient get overlayGradient => AppColors.overlayGradient(this);

  // ==================== IMAGES ====================

  /// Background image
  String get backgroundImage => AppColors.backgroundImage(this);

  /// Logo image
  String get logoImage => AppColors.logoImage(this);

  /// Pattern image
  String get patternImage => AppColors.patternImage(this);

  /// Get icon path
  String iconPath(String name) => AppColors.iconPath(this, name);

  // ==================== SHADOWS ====================

  /// Card shadow
  List<BoxShadow> get cardShadow => AppColors.cardShadow(this);

  /// Button shadow
  List<BoxShadow> get buttonShadow => AppColors.buttonShadow(this);
}