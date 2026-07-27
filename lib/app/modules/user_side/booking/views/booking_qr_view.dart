import 'package:barcode_widget/barcode_widget.dart';

import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/utils/resource_const.dart';

class QRCodeView extends StatelessWidget {
  const QRCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Entry QR Code"),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Entry Pass",
                  color: Colors.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: "Scan Once At The Door",
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

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
                    data: 'BookingID123',
                    color: Colors.black,
                    drawText: false,
                  ),
                ),
              ),
              // ----------------------------------------
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.orange,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    CustomText(text: "Keep Screen Brightness High"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
