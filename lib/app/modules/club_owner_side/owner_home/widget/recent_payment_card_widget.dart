import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_text.dart';

class RecentPaymentCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;

  const RecentPaymentCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);
    const Color greenColor = Color(0xFF2D6A4F);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.credit_card, color: primaryYellow),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                CustomText(
                  text: subtitle,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomText(
              text: amount,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}