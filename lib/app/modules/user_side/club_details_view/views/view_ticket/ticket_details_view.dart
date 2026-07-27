import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart'; // নতুন ইম্পোর্ট

import '../../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../../core/resources/common_widget/custom_button.dart';
import '../../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../../core/resources/common_widget/custom_text.dart';
import 'entry_qr_code_view.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF0D0D0D);
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);

    // আপনার ডাইনামিক টিকিট নাম্বার (API থেকে আসবে)
    final String ticketNumber = "XOYO-7845-9852-2026";

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(
        title: 'Ticket Details',
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            title: 'Show QR',
            buttonColor: primaryYellow,
            isGradient: false,
            borderRadius: 16,
            onTap: () => Get.to(() => const EntryQrCodeView()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1540039155732-d688d52cb4b1',
                height: 220,
                width: double.infinity,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'XOYO London',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoColumn(
                          'Date',
                          'July 12, 2026',
                          CrossAxisAlignment.start,
                        ),
                        _buildInfoColumn(
                          'Time',
                          '6 pm — 11 pm',
                          CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoColumn(
                          'Place',
                          '32-37 Cowper St, London EC2A 4AP',
                          CrossAxisAlignment.start,
                        ),
                        _buildInfoColumn(
                          'Attendees',
                          '3 Tickets',
                          CrossAxisAlignment.end,
                          valueColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Dashed Line Divider
                    Row(
                      children: List.generate(
                        40,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : Colors.grey,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ----------------------------------------
                    // Dynamic Barcode Generator
                    // ----------------------------------------
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: BarcodeWidget(
                        barcode: Barcode.code128(),
                        data: ticketNumber,
                        color: Colors.black,
                        drawText: false, 
                      ),
                    ),
                    // ----------------------------------------

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(
      String label,
      String value,
      CrossAxisAlignment alignment, {
        Color valueColor = Colors.white70,
      }) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        CustomText(text: label, fontSize: 12, color: Colors.grey),
        const SizedBox(height: 4),
        CustomText(
          text: value,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: valueColor,
        ),
      ],
    );
  }
}