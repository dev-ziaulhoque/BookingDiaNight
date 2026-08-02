import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../controllers/owner_home_controller.dart';
import '../widget/oeverview_card_widget.dart';
import '../widget/recent_booking_card_widget.dart';
import '../widget/recent_payment_card_widget.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final OwnerHomeController controller = Get.put(OwnerHomeController());
    const Color bgColor = Color(0xFF0D0D0D);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section
              _buildHeader(),
              const SizedBox(height: 24),

              // 2. Today's Overview Section
              const CustomText(
                text: "Today's Overview",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemCount: controller.overviewData.length,
                itemBuilder: (context, index) {
                  final data = controller.overviewData[index];
                  // আইকনের নাম অনুযায়ী ডাইনামিক আইকন সেটআপ
                  IconData iconData = Icons.wallet;
                  if (data['icon'] == 'table') iconData = Icons.chair_alt;
                  if (data['icon'] == 'calendar')
                    iconData = Icons.calendar_today;
                  if (data['icon'] == 'ticket')
                    iconData = Icons.confirmation_num_outlined;

                  return OverviewCardWidget(
                    icon: iconData,
                    value: data['value'],
                    label: data['label'],
                  );
                },
              ),
              const SizedBox(height: 24),

              // 3. Recent Bookings Section
              const CustomText(
                text: "Recent Bookings",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.recentBookings.length,
                itemBuilder: (context, index) {
                  final booking = controller.recentBookings[index];
                  return RecentBookingCardWidget(
                    imageUrl: booking['image'],
                    title: booking['title'],
                    location: booking['location'],
                    tags: List<String>.from(booking['tags']),
                  );
                },
              ),
              const SizedBox(height: 24),

              // 4. Recent Payments Section
              const CustomText(
                text: "Recent Payments",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.recentPayments.length,
                itemBuilder: (context, index) {
                  final payment = controller.recentPayments[index];
                  return RecentPaymentCardWidget(
                    title: payment['title'],
                    subtitle: payment['subtitle'],
                    amount: payment['amount'],
                  );
                },
              ),

              // Bottom Nav Bar এর জন্য নিচে স্পেস (ঐচ্ছিক)
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  // Header Widget (Can be moved to a separate file if needed)
  Widget _buildHeader() {
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61', // Dummy profile image
          height: 48,
          width: 48,
          boxShape: BoxShape.circle,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Good Evening,',
                fontSize: 12,
                color: Colors.grey,
              ),
              CustomText(
                text: 'Lorengo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
