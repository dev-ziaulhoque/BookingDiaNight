import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/resource_const.dart';

class ExploreController extends GetxController {
  var selectedTab = 'Date'.obs;

  // Date selection
  var selectedDateOption = 'Today'.obs;

  // Location selection
  var selectedLocation = 'Rome'.obs;

  // Price selection
  var selectedPriceRange = 'Under \$20'.obs;

  // Rating selection
  var selectedRating = '4.5+'.obs;

  // ListView or map View
  var isListView = true.obs;

  // Date Controller
  final TextEditingController customDateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.orange,
              onPrimary: Colors.white,
              surface: Color(0xFF1A1A1A),
              onSurface: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.orange),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // ডেট ফরম্যাট করে টেক্সট ফিল্ডে বসানো
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      customDateController.text = formattedDate;
    }
  }
  void resetFilters() {
    selectedDateOption.value = 'Today';
    selectedLocation.value = 'Rome';
    selectedPriceRange.value = 'Under \$20';
    selectedRating.value = '4.5+';
  }
}