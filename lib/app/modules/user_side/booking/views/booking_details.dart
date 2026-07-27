import '../../../../core/resources/common_widget/custom_app_bar.dart'
    show CustomAppBar;
import '../../../../core/resources/common_widget/custom_button.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/resources/common_widget/custom_text_field.dart';
import '../../../../core/utils/resource_const.dart';
import '../../explore/widget/club_event_card.dart';
import '../controllers/booking_controller.dart';
import 'booking_qr_view.dart';

class BookingDetailsView extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsView({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Booking Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClubEventCard(club: booking.club, isFavoriteShow: false,),
            const SizedBox(height: 25),
            _buildSummaryCard("Booking summary", {
              "Venue": booking.venue,
              "Date": booking.date,
              "Time": booking.time,
              "Ticket": booking.tickets,
            }),
            const SizedBox(height: 20),
            _buildSummaryCard("Price breakdown", {
              "Price": booking.price,
              "Total": booking.total,
            }, isPrice: true),
            const SizedBox(height: 40),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    Map<String, String> items, {
    bool isPrice = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          ...items.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: e.key, color: Colors.grey),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomText(
                      text: e.value,
                      color: e.key == "Total" ? Colors.orange : Colors.white,
                      textAlign: TextAlign.right,
                      fontWeight: e.key == "Total"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    if (booking.status == BookingStatus.upcoming) {
      return Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => _showCancelDialog(),
              child: const CustomText(
                text: "Cancel Booking",
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: CustomButton(
              title: "Show QR",
              onTap: () => Get.to(() => QRCodeView()),
            ),
          ),
        ],
      );
    } else if (booking.status == BookingStatus.completed) {
      return CustomButton(
        title: "Leave Review",
        onTap: () => _showReviewSheet(),
      );
    }
    return const Center(
      child: CustomText(
        text: "Booking Canceled",
        color: Colors.red,
        fontSize: 16,
      ),
    );
  }

  void _showCancelDialog() {
    Get.defaultDialog(
      backgroundColor: const Color(0xFF1A1A1A),
      title: "",
      content: Column(
        children: [
          const Icon(Icons.cancel, color: Colors.red, size: 80),
          const SizedBox(height: 20),
          const CustomText(
            text: "Are you cancel the booking",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: CustomText(
              text: "You've successfully book the event ticket...",
              textAlign: TextAlign.center,
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: "No",
                  isGradient: false,
                  buttonColor: Colors.white10,
                  onTap: () => Get.back(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(title: "Yes", onTap: () => Get.back()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showReviewSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D0D),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomText(
              text: "Write A Review",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) =>
                    const Icon(Icons.star_border, color: Colors.grey, size: 40),
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextField(hint: "What Did You Think?", maxLines: 4),
            const SizedBox(height: 25),
            CustomButton(title: "Rate Now!", onTap: () => Get.back()),
          ],
        ),
      ),
    );
  }
}
