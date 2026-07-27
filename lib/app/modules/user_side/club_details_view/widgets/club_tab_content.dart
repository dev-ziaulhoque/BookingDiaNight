import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';

class ClubTabContent {
  // Custom Tab Button
  static Widget buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryColor : const Color(0xFF2A2A2A),
          ),
        ),
        child: CustomText(
          text: title,
          color: isSelected ? Colors.white : Colors.white70,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  // 1. About Tab
  static Widget buildAboutTab(Color textGrey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Description',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        const SizedBox(height: 12),
        CustomText(
          text:
              'Get ready for a high-energy evening featuring live music, signature cocktails, VIP tables, and an unforgettable party crowd. Book your spot early and enjoy a seamless night out at one of the city\'s most exciting venues.\n\nJoin us for an unforgettable night filled with great music, energetic vibes, premium drinks, and a crowd ready to celebrate.',
          fontSize: 14,
          color: textGrey,
          height: 1.5,
        ),
      ],
    );
  }

  // 2. Address Tab
  static Widget buildAddressTab(Color cardBgColor, Color textGrey) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _addressRow('Venue', '32-37 Cowper St, London EC2A 4AP', textGrey),
          const SizedBox(height: 16),
          _addressRow('Opening hours', 'Fri: 6 pm — 11 pm', textGrey),
          const SizedBox(height: 16),
          _addressRow('Price range', '\$191.00 person', textGrey),
          const SizedBox(height: 16),
          _addressRow('Dress code', 'Smart casual', textGrey),
        ],
      ),
    );
  }

  static Widget _addressRow(String label, String value, Color textGrey) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: CustomText(text: label, fontSize: 14, color: textGrey),
        ),
        Expanded(
          flex: 3,
          child: CustomText(
            text: value,
            fontSize: 14,
            color: Colors.white,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  // 3. Photos Tab
  static Widget buildPhotosTab(List<String> photos) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return CustomNetworkImage(
          imageUrl: photos[index],
          height: double.infinity,
          width: double.infinity,
          borderRadius: BorderRadius.circular(12),
        );
      },
    );
  }

  // 4. Reviews Tab
  static Widget buildReviewsTab(
    List<Map<String, dynamic>> reviews,
    Color primaryColor,
    Color textGrey,
  ) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: reviews.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: review['name'],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                Row(
                  children: List.generate(5, (starIndex) {
                    return Icon(
                      starIndex < review['rating']
                          ? Icons.star
                          : Icons.star_border,
                      color: primaryColor,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 4),
            CustomText(text: review['date'], fontSize: 12, color: textGrey),
            const SizedBox(height: 12),
            CustomText(
              text: review['comment'],
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ],
        );
      },
    );
  }
}
