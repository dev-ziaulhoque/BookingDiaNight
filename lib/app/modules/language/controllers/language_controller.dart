import 'package:bookdianight_app/app/core/resources/app_const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/local_storage/local_storage.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }
  void loadSavedLanguage() {
    var savedLang = LocalStorage.getData(key: AppConst.languageCode);

    if (savedLang != null) {
      selectedLanguage.value = savedLang;
    } else {
      selectedLanguage.value = 'en';
    }
    print("Loaded Language: ${selectedLanguage.value}");
  }

  void updateLanguage(String langCode) {
    selectedLanguage.value = langCode;
  }

  Future<void> saveChanges() async {
    await LocalStorage.saveData(key: AppConst.languageCode, data: selectedLanguage.value);

    var locale = Locale(selectedLanguage.value);
    Get.updateLocale(locale);

    print("Language Saved & Applied: ${selectedLanguage.value}");

    Get.snackbar(
      "Success",
      "Language changed to ${selectedLanguage.value == 'en' ? 'English' : 'Arabic'}",
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }
}