// import 'package:bookdianight_app/app/core/resources/common_widget/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/resources/common_style/extention.dart';
// import '../../../core/resources/common_widget/build_app_bar.dart';
// import '../../../core/resources/common_widget/custom_text.dart';
// import '../../../core/resources/common_widget/gradient_scaffold.dart';
// import '../controllers/language_controller.dart';
// import '../widgets/language_option_card.dart';
//
// class LanguageView extends StatelessWidget {
//   const LanguageView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LanguageController());
//
//     return GradientScaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BuildAppBar(title: 'language'.tr),
//
//           20.heightBox,
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: CustomText(text: 'selected_language'.tr, fontSize: 14),
//           ),
//
//           15.heightBox,
//
//           // Reactive List
//           Obx(
//             () => Column(
//               children: [
//                 LanguageOptionCard(
//                   title: 'English',
//                   isSelected: controller.selectedLanguage.value == 'en',
//                   onTap: () => controller.updateLanguage('en'),
//                 ),
//                 15.heightBox,
//                 LanguageOptionCard(
//                   title: 'Arabic',
//                   isSelected: controller.selectedLanguage.value == 'ar',
//                   onTap: () => controller.updateLanguage('ar'),
//                 ),
//               ],
//             ),
//           ),
//
//           30.heightBox,
//           CustomButton(
//             title: 'save_changes'.tr,
//             onTap: () {
//               controller.saveChanges();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
