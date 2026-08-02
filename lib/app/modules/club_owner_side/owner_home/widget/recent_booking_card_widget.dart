import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';

class RecentBookingCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final List<String> tags;

  const RecentBookingCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Color(0xFF161616);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: imageUrl,
            height: 70,
            width: 70,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    CustomText(text: location, fontSize: 12, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: tags.map((tag) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomText(text: tag, fontSize: 10, color: Colors.white70),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}