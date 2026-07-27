import 'package:bookdianight_app/app/modules/user_side/club_details_view/views/view_ticket/ticket_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../../core/resources/common_widget/custom_button.dart';
import '../../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../../core/resources/common_widget/custom_text.dart';
import '../../../dashboard/user_dashboard.dart';

class TicketBookingDetailsView extends StatelessWidget {
  const TicketBookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF0D0D0D);
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(
        title: 'Booking Details',
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            title: 'Pay & Confirm Booking - \$576',
            buttonColor: primaryYellow,
            isGradient: false,
            borderRadius: 16,
            onTap: () =>
                _showPaymentSuccessDialog(context, primaryYellow, cardBgColor),
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
            _buildSummaryCard(cardBgColor, 'Booking summary', {
              'Venue': '32-37 Cowper St, London EC2A 4AP',
              'Date': 'July 12, 2026',
              'Time': '6 pm — 11 pm',
              'Ticket': '3 ticket',
            }),
            const SizedBox(height: 24),
            _buildSummaryCard(
              cardBgColor,
              'Price breakdown',
              {'Price': '3X\$191.00'},
              isPriceBreakdown: true,
              primaryYellow: primaryYellow,
            ),
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
                    text: '4.8 (256)',
                    fontSize: 14,
                    color: Colors.white,
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

  Widget _buildSummaryCard(
    Color cardBgColor,
    String title,
    Map<String, String> data, {
    bool isPriceBreakdown = false,
    Color? primaryYellow,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(16),
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
          const SizedBox(height: 16),
          ...data.entries.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: e.key, fontSize: 14, color: Colors.grey),
                  CustomText(
                    text: e.value,
                    fontSize: 14,
                    color: Colors.white,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
          if (isPriceBreakdown) ...[
            const Divider(color: Colors.white10),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Total',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomText(
                  text: '\$576',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryYellow ?? Colors.white,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showPaymentSuccessDialog(
    BuildContext context,
    Color primaryYellow,
    Color cardBgColor,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF161616),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 32),
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 24),
                const CustomText(
                  text: 'Payment Successful!',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const CustomText(
                  text:
                      'You\'ve successfully booked the event ticket, for detailed information you can check on my booking page.',
                  fontSize: 14,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                  height: 1.5,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  title: 'View Event Ticket',
                  buttonColor: primaryYellow,
                  isGradient: false,
                  borderRadius: 16,
                  onTap: () {
                    Get.back(); // close dialog
                    Get.to(() => const TicketDetailsView());
                  },
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Get.offAll(()=> UserDashboard()), // Navigate to Home
                  child: const CustomText(
                    text: 'Back To Homepage',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
