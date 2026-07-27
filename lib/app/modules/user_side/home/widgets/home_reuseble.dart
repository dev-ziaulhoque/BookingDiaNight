import 'package:flutter/material.dart';

import '../../../../core/resources/common_widget/custom_text.dart';

class CommonComponents {
  static Widget buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
      ),
      child: CustomText(
        text: text,
        fontSize: 6,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  // Section Title এবং 'See all' বাটনের জন্য
  static Widget sectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Row(
            children: [
              CustomText(
                text: "See all",
                fontSize: 12,
                color: Colors.orangeAccent,
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.chevron_right,
                color: Colors.orangeAccent,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}