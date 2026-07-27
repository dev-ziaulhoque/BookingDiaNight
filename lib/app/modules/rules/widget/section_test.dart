import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/utils/resource_const.dart';

class SectionTest extends StatelessWidget {
  final String text;
  const SectionTest({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
}
