import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSwitch extends StatelessWidget {
  /// Whether the switch is on or off
  final bool value;

  /// Callback when the state changes
  final ValueChanged<bool> onChanged;

  /// Width of the switch track
  final double width;

  /// Height of the switch track
  final double height;

  /// Size of the moving thumb (circle)
  final double thumbSize;

  /// Padding between the thumb and the track edge
  final double thumbPadding;

  /// Background color when active (ON)
  final Color activeColor;

  /// Background color when inactive (OFF)
  final Color inactiveColor;

  /// Color of the moving thumb
  final Color thumbColor;

  /// Optional text to show when ON (e.g., "ON", "Yes")
  final String? activeText;

  /// Optional text to show when OFF (e.g., "OFF", "No")
  final String? inactiveText;

  /// Optional icon to show when ON
  final IconData? activeIcon;

  /// Optional icon to show when OFF
  final IconData? inactiveIcon;

  /// Text/Icon color
  final Color contentColor;

  /// Font size for text
  final double fontSize;

  /// Animation duration
  final Duration duration;

  /// Enable Haptic Feedback (vibration)
  final bool enableHapticFeedback;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 70.0,
    this.height = 35.0,
    this.thumbSize = 28.0,
    this.thumbPadding = 4.0,
    this.activeColor = const Color(0xFFE4B325),
    this.inactiveColor = const Color(0xFF251C12),
    this.thumbColor = Colors.white,
    this.activeText,
    this.inactiveText,
    this.activeIcon,
    this.inactiveIcon,
    this.contentColor = Colors.white,
    this.fontSize = 12.0,
    this.duration = const Duration(milliseconds: 250),
    this.enableHapticFeedback = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enableHapticFeedback) HapticFeedback.lightImpact();
        onChanged(!value);
      },
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: value ? activeColor : inactiveColor,
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // --- Background Content (Text/Icons) ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: thumbPadding + 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Show content on Left ONLY if switch is ON
                  Opacity(
                    opacity: value ? 1.0 : 0.0,
                    child: _buildContent(activeText, activeIcon),
                  ),
                  // Show content on Right ONLY if switch is OFF
                  Opacity(
                    opacity: !value ? 1.0 : 0.0,
                    child: _buildContent(inactiveText, inactiveIcon),
                  ),
                ],
              ),
            ),

            // --- The Moving Thumb ---
            AnimatedAlign(
              duration: duration,
              curve: Curves.easeInOut,
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(thumbPadding),
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    color: thumbColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to render Text or Icon
  Widget _buildContent(String? text, IconData? icon) {
    if (icon != null) {
      return Icon(icon, color: contentColor, size: fontSize + 4);
    }
    if (text != null) {
      return Text(
        text,
        style: TextStyle(
          color: contentColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return const SizedBox();
  }
}