import 'package:bookdianight_app/app/modules/user_side/club_details_view/views/view_ticket/ticket_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../../core/resources/common_widget/custom_button.dart';
import '../../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../../core/resources/common_widget/custom_text.dart';
import '../../controllers/buy_ticker_controller.dart';

class SelectDateTimeView extends StatelessWidget {
  const SelectDateTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuyTickerController());
    const Color bgColor = Color(0xFF0D0D0D);
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(
        title: 'Select Date & Time',
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            title: 'Get A Ticket',
            buttonColor: primaryYellow,
            isGradient: false,
            borderRadius: 16,
            onTap: () => Get.to(() =>  TicketBookingDetailsView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventCard(cardBgColor, primaryYellow),
            const SizedBox(height: 24),
            _buildCalendarCard(cardBgColor, primaryYellow, controller),
            const SizedBox(height: 16),
            _buildTimeSelector(cardBgColor),
            const SizedBox(height: 24),
            const CustomText(
              text: 'Guests',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            _buildGuestCounter(cardBgColor, primaryYellow, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(Color cardBgColor, Color primaryYellow) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1540039155732-d688d52cb4b1',
            height: 140,
            width: double.infinity,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'XOYO London',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              Row(
                children: [
                  Icon(Icons.star, color: primaryYellow, size: 16),
                  const SizedBox(width: 4),
                  const CustomText(
                    text: '4.8 ',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const CustomText(
                    text: '(256)',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 16,
              ),
              const SizedBox(width: 4),
              const CustomText(
                text: 'Shoreditch',
                fontSize: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarCard(
    Color cardBgColor,
    Color primaryYellow,
      BuyTickerController controller,
  ) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<int> dates = List.generate(31, (i) => i + 1);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
                size: 16,
              ),
              const CustomText(
                text: 'July 2026 ⌄',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: days
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: CustomText(
                        text: day,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dates.length + 4, // 4 empty slots for padding
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (index < 4) {
                return Center(
                  child: CustomText(
                    text: '${27 + index}',
                    color: Colors.white24,
                  ),
                );
              }
              int date = dates[index - 4];
              return Obx(() {
                bool isSelected = controller.selectedDate.value == date;
                return GestureDetector(
                  onTap: () => controller.selectDate(date),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? primaryYellow : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: CustomText(
                      text: '$date',
                      color: isSelected ? Colors.black : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelector(Color cardBgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomText(
            text: 'Time',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const CustomText(
              text: '6 pm — 11 pm',
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestCounter(
    Color cardBgColor,
    Color primaryYellow,
      BuyTickerController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.people_outline, color: primaryYellow),
              const SizedBox(width: 8),
              Obx(
                () => CustomText(
                  text: '${controller.guestCount.value} guests',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: controller.decrementGuest,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => CustomText(
                  text: '${controller.guestCount.value}',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: controller.incrementGuest,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    color: primaryYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.black, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
