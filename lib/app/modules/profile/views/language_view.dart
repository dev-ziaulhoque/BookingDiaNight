import '../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/utils/resource_const.dart';
import '../controllers/profile_controller.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final languages = ["English", "Spanish", "French", "German", "Arabic"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Language"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Select Language",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (_, __) => const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool isSelected =
                        controller.selectedLanguage.value == languages[index];
                    return GestureDetector(
                      onTap: () =>
                          controller.selectedLanguage.value = languages[index],
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: isSelected
                                ? Colors.orange
                                : Colors.transparent,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.translate,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 15),
                            CustomText(text: languages[index], fontSize: 16),
                            const Spacer(),
                            Icon(
                              isSelected
                                  ? Icons.check_circle
                                  : Icons.radio_button_off,
                              color: isSelected ? Colors.orange : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
