import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_text.dart';

class ClubInfoSection extends StatelessWidget {
  final String title;
  final String rating;
  final String reviewsCount;
  final String price;
  final Color primaryColor;
  final Color textGrey;
  final String type;

  const ClubInfoSection({
    super.key,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.primaryColor,
    required this.textGrey,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            text: type,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            Row(
              children: [
                Icon(Icons.star, color: primaryColor, size: 18),
                const SizedBox(width: 4),
                CustomText(
                  text: rating,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomText(
                  text: reviewsCount,
                  fontSize: 14,
                  color: textGrey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),

        if (type.toLowerCase() != 'club') // চাইলে ক্লাব হলে পার-পার্সন প্রাইস হাইড করতে পারেন
          Row(
            children: [
              CustomText(
                text: price,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              CustomText(
                text: ' /person',
                fontSize: 14,
                color: textGrey,
              ),
            ],
          ),
      ],
    );
  }
}