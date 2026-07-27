
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/extentions/theme_extention.dart';
import '../../../core/utils/resource_const.dart';

class FaqItem extends StatelessWidget {
  final String title;
  final String description;
  const FaqItem({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          if (description.isNotEmpty)
            const SizedBox(height: 8),
          if (description.isNotEmpty)
            CustomText(
            text: description,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: context.textColor.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
