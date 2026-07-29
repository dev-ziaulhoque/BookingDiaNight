// lib/app/core/theme/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // ==================== FIXED COLORS (Theme Independent) ====================

  static const mainColor = Color(0xFFC88E02);

  static const universalColor = Color(0xffFA9416);
  static const errorColor = Color(0xffDC143C);
  static const errorRedColor = Colors.red;

  // Secondary colors
  static const secondaryColor = Color(0xff41AB5D);
  static const greenLightHover = Color(0xffE3F2E7);
  static const greenNormalHover = Color(0xff3B9A54);
  static const primaryDeep = Color(0xffC1A86E);
  static const primaryLight = Color(0xffDCD2CB);

  // Blue shades
  static const blueDark = Color(0xff0C4798);
  static const blueDarker = Color(0xff062147);
  static const blueDarkActive = Color(0xff072B5B);
  static const darkBlue = Color(0xff3510BB);

  // Pink shades
  static const pink = Color(0xffC850A7);
  static const pink50 = Color(0xffFAEEF6);
  static const pink100 = Color(0xffEEC9E4);
  static const pink200 = Color(0xffC89BC1);
  static const darkPink = Color(0xff882578);


  // ==================== DYNAMIC COLORS (Theme Dependent) ====================
  // এই colors theme অনুযায়ী বদলাবে

  /// Primary color - Main brand color
  static Color primaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xffB77909)
        : const Color(0xffFA9416);
  }

  static const LinearGradient mainButtonGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFAF7915),
      Color(0xFFC88B1D),
      Color(0xFFD99E28),
      Color(0xFFE7B733),
    ],
    stops: [0.0, 0.35, 0.7, 1.0],
  );

  /// Background color
  static Color backgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : const Color(0xFFFFFFFF);
  }

  /// Surface color (Cards, Containers)
  static Color surfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF1E1E1E)
        : Colors.white;
  }

  /// Card background
  static Color cardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff160B07)
        : Colors.white;
  }
  /// Card background
  static Color secondaryCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  /// Text colors
  static Color textColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFF8FAFC) // whiteColor
        : Colors.white; // blackColor
  }
  /// Text colors
  static Color secondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
  }

  /// subtitle colors
  static Color subtitleColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFCBD5E1)
        : const Color(0xFF61727E);
  }

  /// input colors
  static Color inputColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFFF8FAFC)
        : const Color(0xFF111111);
  }

  static Color textSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF595959) // whiteDarker
        : const Color(0xFF5C5C5C); // black100
  }

  /// Border colors
  static Color borderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white24
        : Colors.white;
  }

  static Color dividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white10
        : Colors.black12;
  }

  /// Icon color
  static Color iconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.white;
  }

  /// Hover colors
  static Color hoverColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF989898)
        : const Color(0xffE3F2E7);
  }

  // ==================== GRADIENTS ====================
  /// Primary gradient for backgrounds
  static LinearGradient primaryGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: Theme.of(context).brightness == Brightness.dark
          ? [Color(0xff323232), Color(0xff070200), Color(0xff000000), Color(0xff383838)]
          : [Colors.white, Color(0xffEFDDBD),],
      // stops: const [0.1, 1.0],
    );
  }

  /// Card gradient
  static LinearGradient cardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xff2B1B14),
        const Color(0xff1A1208),
      ]
          : [
        Colors.white,
        const Color(0xffFAFAFA),
      ],
    );
  }

  /// Gold gradient (Fixed - for buttons/highlights)
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffB77909),
      Color(0xffF4B000),
    ],
  );

  /// Button gradient
  static LinearGradient navBarGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        const Color(0xffD6AA43),
        const Color(0xffB77909),
        const Color(0xff8B5A06),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.0, 0.5, 1.0],
    );
  }

  /// Button gradient
  static LinearGradient buttonGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xFFE6CA6E),
        const Color(0xFF775806),
      ]
          : [
        const Color(0xffB77909),
        const Color(0xff8B5A06),
      ],
    );
  }

  /// Button gradient
  static LinearGradient secondaryButtonGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xFFE6CA6E),
        const Color(0xFF775806),
      ]
          : [
        const Color(0xFFE6CA6E),
        const Color(0xFF775806),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
  /// Button gradient
  static LinearGradient textGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xFFE6CA6E),
        const Color(0xFF775806),
      ]
          : [
        const Color(0xffB77909),
        const Color(0xff8B5A06),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.5, 1.0],
    );
  }

  /// Button gradient
  static LinearGradient borderGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xffE3A90A),
        const Color(0xffB77909),
      ]
          : [
        const Color(0xffB77909),
        const Color(0xff8B5A06),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  /// Hero section gradient
  static RadialGradient heroGradient(BuildContext context) {
    return RadialGradient(
      center: Alignment.center,
      radius: 1.5,
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xff2B1B14),
        Colors.black,
      ]
          : [
        Colors.white,
        const Color(0xffE8E8E8),
      ],
    );
  }

  /// Green gradient for success states
  static LinearGradient successGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        const Color(0xff41AB5D),
        const Color(0xff3B9A54),
      ]
          : [
        const Color(0xff41AB5D),
        const Color(0xff2D7A3E),
      ],
    );
  }

  // ==================== IMAGES ====================

  /// Background images
  static String backgroundImage(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/bg_dark.png'
        : 'assets/images/bg_light.png';
  }

  /// Logo images
  static String logoImage(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/logo_dark.png'
        : 'assets/images/logo_light.png';
  }

  /// Dynamic icon path
  static String iconPath(BuildContext context, String iconName) {
    final theme = Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light';
    return 'assets/icons/$theme/$iconName.png';
  }


  /// Pattern overlay
  static String patternImage(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/pattern_dark.png'
        : 'assets/images/pattern_light.png';
  }

  // ==================== SHADOWS ====================

  /// Card shadow
  static List<BoxShadow> cardShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withOpacity(0.3)
            : Colors.black.withOpacity(0.1),
        blurRadius: 1,
        spreadRadius: 1,
        offset: const Offset(0, 1),
      ),
    ];
  }

  /// Button shadow
  static List<BoxShadow> buttonShadow(BuildContext context) {
    return [
      BoxShadow(
        color: mainColor.withOpacity(0.3),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ];
  }

  // ==================== OVERLAY COLORS ====================

  /// Overlay for images
  static LinearGradient overlayGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: Theme.of(context).brightness == Brightness.dark
          ? [
        Colors.black.withOpacity(0.5),
        Colors.black.withOpacity(0.8),
      ]
          : [
        Colors.white.withOpacity(0.3),
        Colors.white.withOpacity(0.6),
      ],
    );
  }
}