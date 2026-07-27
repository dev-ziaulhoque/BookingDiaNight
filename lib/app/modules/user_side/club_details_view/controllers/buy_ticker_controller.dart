import 'package:get/get.dart';

class BuyTickerController extends GetxController {
  var guestCount = 2.obs;
  var selectedDate = 20.obs;

  void incrementGuest() {
    guestCount.value++;
  }

  void decrementGuest() {
    if (guestCount.value > 1) {
      guestCount.value--;
    }
  }

  void selectDate(int date) {
    selectedDate.value = date;
  }
}