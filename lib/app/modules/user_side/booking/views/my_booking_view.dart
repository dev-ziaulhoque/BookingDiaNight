import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/utils/resource_const.dart';
import '../../explore/widget/club_event_card.dart';
import '../controllers/booking_controller.dart';
import 'booking_details.dart';

class MyBookingsView extends StatelessWidget {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(
        title: "My Bookings",
        centerTitle: true,
        leading: SizedBox(),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTab("Upcoming", 0, controller),
                _buildTab("Completed", 1, controller),
                _buildTab("Canceled", 2, controller),
              ],
            ),
          ),
          const Divider(color: Colors.white10, height: 1),

          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: controller.filteredBookings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final booking = controller.filteredBookings[index];
                  return GestureDetector(
                    onTap: () =>
                        Get.to(() => BookingDetailsView(booking: booking)),
                    child: ClubEventCard(club: booking.club, isFavoriteShow: false,),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, BookingController controller) {
    bool isSel = controller.selectedTab.value == index;
    return GestureDetector(
      onTap: () => controller.selectedTab.value = index,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSel ? Colors.orange : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: CustomText(
          text: label,
          color: isSel ? Colors.white : Colors.grey,
          fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
