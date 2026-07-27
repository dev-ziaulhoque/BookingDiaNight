import 'package:bookdianight_app/app/modules/user_side/dashboard/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart'; // <--- এখানে ইম্পোর্ট করা হলো

import '../../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../../core/resources/common_widget/custom_button.dart';
import '../../../../../core/resources/common_widget/custom_text.dart';

class EntryQrCodeView extends StatelessWidget {
  const EntryQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF0D0D0D);
    const Color cardBgColor = Color(0xFF161616);
    const Color primaryYellow = Color(0xFFDCA73A);

    final String qrData = "https://yourwebsite.com/verify-ticket/XOYO-7845-9852-2026";

    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomAppBar(
        title: 'Entry QR Code',
        backgroundColor: bgColor,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            title: 'Back To Homepage',
            buttonColor: primaryYellow,
            isGradient: false,
            borderRadius: 16,
            onTap: () => Get.offAll(()=> UserDashboard()),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Entry Pass',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryYellow,
                ),
                const SizedBox(height: 4),
                const CustomText(
                  text: 'Scan Once At The Door',
                  fontSize: 12,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.white10),
                const SizedBox(height: 24),

                // ----------------------------------------
                // Dynamic QR Code Generator
                // ----------------------------------------
                Center(
                  child: Container(
                    height: 220,
                    width: 220,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      data: qrData,
                      color: Colors.black,
                      drawText: false,
                    ),
                  ),
                ),
                // ----------------------------------------

                const SizedBox(height: 32),
                // Brightness Indicator
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: primaryYellow,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const CustomText(
                        text: 'Keep Screen Brightness High',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}