import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_text.dart';

class OverviewCardWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const OverviewCardWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryYellow.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: primaryYellow, size: 20),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: value,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryYellow,
          ),
          const SizedBox(height: 4),
          CustomText(
            text: label,
            fontSize: 12,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}