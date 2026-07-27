import 'package:bookdianight_app/app/modules/user_side/home/controllers/club_controller.dart';

import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/utils/resource_const.dart';
import '../../explore/widget/club_event_card.dart';

class TonightNearYouView extends StatelessWidget {
  const TonightNearYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "🌙 Tonight Near You",
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