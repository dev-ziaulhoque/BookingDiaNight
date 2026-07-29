import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/utils/resource_const.dart';
import '../../explore/widget/club_event_card.dart';
import '../controllers/club_controller.dart';

class ExploreVipTable extends StatelessWidget {
  const ExploreVipTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "👑 VIP table deals",
        backgroundColor: Colors.black,
      ),
      body: Obx(() => ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: controller.tonightClubs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) => ClubEventCard(club: controller.tonightClubs[index]),
      )),
    );
  }
}
