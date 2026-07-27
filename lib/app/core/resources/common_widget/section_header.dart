
import '../../utils/resource_const.dart';
import 'custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showSeeAll;
  final VoidCallback? onTap;
  const SectionHeader({
    super.key,
    required this.title,
    this.showSeeAll = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, fontSize: 16, fontWeight: FontWeight.w600),
        if (showSeeAll)
          InkWell(
            onTap: onTap,
            child: CustomText(text: "See All"),
          ),
      ],
    );
  }
}
