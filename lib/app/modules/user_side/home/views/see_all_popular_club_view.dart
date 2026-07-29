import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/utils/resource_const.dart';
import '../controllers/club_controller.dart';
import '../widgets/club_list_tile.dart';

class SeeAllPopularClubView extends StatelessWidget {
  const SeeAllPopularClubView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "🔥 Popular clubs",
        backgroundColor: Colors.black,
      ),
      body: Obx(() =>  ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.popularClubs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemBuilder: (context, index) =>
            ClubListTile(club: controller.popularClubs[index]),
      ),),
    );
  }
}
