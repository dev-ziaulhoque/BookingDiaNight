import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../controllers/map_overview_controller.dart';

// View
class MapOverviewScreen extends StatelessWidget {
  const MapOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapOverviewController controller = Get.put(MapOverviewController());

    return Scaffold(
      extendBodyBehindAppBar: true,

      // App Bar
      appBar: CustomAppBar(
        title: 'Map Overview',
        centerTitle: true,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ),

      // Map Body
      body: Stack(
        children: [
          Obx(
                () => GoogleMap(
              initialCameraPosition: MapOverviewController.initialPosition,
              markers: controller.markers.toSet(),
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              onMapCreated: controller.onMapCreated,
            ),
          ),

          // Floating Map Controls
          Positioned(
            right: 16,
            top: 140,
            child: Column(
              children: [
                _buildMapControlButton(
                  icon: Icons.add,
                  onTap: controller.zoomIn,
                  backgroundColor: const Color(0xFF2C241B),
                  iconColor: Colors.white,
                ),
                const SizedBox(height: 8),
                _buildMapControlButton(
                  icon: Icons.remove,
                  onTap: controller.zoomOut,
                  backgroundColor: const Color(0xFF2C241B),
                  iconColor: Colors.white,
                ),
                const SizedBox(height: 24),
                _buildMapControlButton(
                  icon: Icons.my_location,
                  onTap: controller.goToCurrentLocation,
                  backgroundColor: const Color(0xFFFF5227),
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Map Control Button
  Widget _buildMapControlButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
      ),
    );
  }
}