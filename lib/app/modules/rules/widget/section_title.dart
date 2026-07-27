import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/utils/resource_const.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}
