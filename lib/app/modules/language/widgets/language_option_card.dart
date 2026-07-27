import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/utils/resource_const.dart';

class LanguageOptionCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const LanguageOptionCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? context.inputColor : context.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: GradientBoxBorder(
            gradient: context.borderGradient,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.translate,
              color: isSelected ? const Color(0xffF4B000) : ContextExtensionss(context).iconColor,
            ),
            15.widthBox,
            CustomText(
              text: title,
              color: isSelected ? const Color(0xffF4B000) : context.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            if (isSelected)
              Icon(Icons.radio_button_checked, color: Color(0xffF4B000))
            else
              Icon(Icons.radio_button_off, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
