import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/utils/resource_const.dart';
import '../controllers/club_controller.dart';
import 'home_reuseble.dart';

class ClubListTile extends StatelessWidget {
  final ClubModel club;
  const ClubListTile({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: club.image,
            height: 80,
            width: 80,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: club.title,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        CustomText(
                          text: " ${club.rating}",
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 12,
                    ),
                    CustomText(
                      text: club.location,
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (club.tags != null)
                      ...club.tags!.map(
                        (tag) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: CommonComponents.buildBadge(tag),
                        ),
                      ),
                    const Spacer(),
                    CustomText(
                      text: "From ${club.price}",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
}
