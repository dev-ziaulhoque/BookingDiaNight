import 'package:flutter/material.dart';
import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../home/controllers/club_controller.dart';

class ClubEventCard extends StatelessWidget {
  final ClubModel club;
  final double? width;
  final bool? isFavoriteShow;
  final double imageHeight;

  const ClubEventCard({
    super.key,
    required this.club,
    this.width,
    this.isFavoriteShow = true,
    this.imageHeight = 240,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // 1. Background Image
          CustomNetworkImage(
            imageUrl: club.image,
            height: double.infinity,
            width: double.infinity,
            borderRadius: BorderRadius.circular(25),
          ),

          // 2. Gradient Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.5, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // 3. Favorite Button (Top Right)
          Positioned(
            top: 15,
            right: 15,
            child: isFavoriteShow == true ? Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_border, color: Colors.white, size: 22),
            ):const SizedBox.shrink(),
          ),

          // 4. Content (Badge, Title, Location, Rating)
          Positioned(
            bottom: 15,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge
                _buildBadge(club.type),
                const SizedBox(height: 10),

                // Title
                CustomText(
                  text: club.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),

                // Location & Rating/Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, color: Colors.grey, size: 18),
                        const SizedBox(width: 4),
                        CustomText(
                          text: club.location,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ],
                    ),

                    // Rating & Price
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        CustomText(
                          text: "${club.rating} • From ${club.price}",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
      ),
      child: CustomText(
        text: text,
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}