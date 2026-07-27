import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/common_widget/custom_button.dart';
import '../../../../core/resources/common_widget/custom_drop_down_widget.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/resources/common_widget/custom_text_field.dart';
import '../controllers/explore_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreController());

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: "Filter",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () => controller.resetFilters(),
                child: const CustomText(
                  text: "Reset Now",
                  color: Colors.orange,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Category Dropdown
          const CustomDropDownWidget(
            items: ["Club", "Bar", "Lounge"],
            hintText: "Select Category",
            selectedValue: "Club",
          ),
          const SizedBox(height: 20),

          // Filter Tabs (Date, Location, Price, Rating)
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem("Date", controller),
                _buildTabItem("Location", controller),
                _buildTabItem("Price", controller),
                _buildTabItem("Rating", controller),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // Dynamic Content based on selected tab
          Obx(() {
            switch (controller.selectedTab.value) {
              case 'Date':
                return _buildDateFilter(controller);
              case 'Location':
                return _buildLocationFilter(controller);
              case 'Price':
                return _buildPriceFilter(controller);
              case 'Rating':
                return _buildRatingFilter(controller);
              default:
                return const SizedBox();
            }
          }),

          const SizedBox(height: 30),
          CustomButton(title: "Apply", onTap: () => Get.back()),
        ],
      ),
    );
  }

  // Tab Item Builder
  Widget _buildTabItem(String title, ExploreController controller) {
    bool isSelected = controller.selectedTab.value == title;
    return GestureDetector(
      onTap: () => controller.selectedTab.value = title,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.transparent
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
          ),
        ),
        child: CustomText(
          text: title,
          color: isSelected ? Colors.white : Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }

  // 1. Date Filter View
  Widget _buildDateFilter(ExploreController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Select Date",
          color: Colors.white,
          fontSize: 16,
        ),
        const Divider(color: Colors.white10, height: 30),
        _buildRadioOption("Today", controller.selectedDateOption),
        _buildRadioOption("Tomorrow", controller.selectedDateOption),
        const SizedBox(height: 20),
        const CustomText(
          text: "Custom Date",
          color: Colors.white,
          fontSize: 14,
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => controller.selectDate(Get.context!),
          child: AbsorbPointer(
            child: CustomTextField(
              controller: controller.customDateController,
              hint: "DD/MM/YYYY",
              readOnly: true,
              suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  // 2. Location Filter View
  Widget _buildLocationFilter(ExploreController controller) {
    List<String> locations = [
      "Rome",
      "Florence",
      "Venice",
      "Milan",
      "Sardinia",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(
          hint: "Search location",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        const CustomText(
          text: "Select Location",
          color: Colors.white,
          fontSize: 16,
        ),
        const Divider(color: Colors.white10),
        ...locations.map(
          (loc) => _buildSelectionList(loc, controller.selectedLocation),
        ),
      ],
    );
  }

  // 3. Price Filter View
  Widget _buildPriceFilter(ExploreController controller) {
    List<String> prices = ["Under \$20", "\$25 to \$100", "\$100 to \$300"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Select Price",
          color: Colors.white,
          fontSize: 16,
        ),
        const SizedBox(height: 15),
        const Row(
          children: [
            Expanded(child: CustomTextField(hint: "Min price")),
            SizedBox(width: 15),
            Expanded(child: CustomTextField(hint: "Max price")),
          ],
        ),
        const SizedBox(height: 20),
        ...prices.map(
          (p) => _buildSelectionList(p, controller.selectedPriceRange),
        ),
      ],
    );
  }

  // 4. Rating Filter View
  Widget _buildRatingFilter(ExploreController controller) {
    List<String> ratings = ["4.5+", "4.00 - 4.5", "3.5 - 4.00"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Select Rating",
          color: Colors.white,
          fontSize: 16,
        ),
        const SizedBox(height: 15),
        Row(
          children: ratings.map((r) {
            bool isSel = controller.selectedRating.value == r;
            return GestureDetector(
              onTap: () => controller.selectedRating.value = r,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSel ? Colors.orange : Colors.white10,
                  ),
                  color: isSel
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.05),
                ),
                child: CustomText(
                  text: r,
                  color: isSel ? Colors.orange : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Helper: Radio Style Option
  Widget _buildRadioOption(String title, RxString groupValue) {
    return Obx(
      () => ListTile(
        onTap: () => groupValue.value = title,
        contentPadding: EdgeInsets.zero,
        title: CustomText(
          text: title,
          color: groupValue.value == title ? Colors.orange : Colors.white,
        ),
        trailing: Icon(
          groupValue.value == title
              ? Icons.radio_button_checked
              : Icons.radio_button_off,
          color: groupValue.value == title ? Colors.orange : Colors.grey,
        ),
      ),
    );
  }

  // Helper: List Selection Style
  Widget _buildSelectionList(String title, RxString selectedValue) {
    return Obx(
      () => InkWell(
        onTap: () => selectedValue.value = title,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: CustomText(
            text: title,
            color: selectedValue.value == title ? Colors.orange : Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
