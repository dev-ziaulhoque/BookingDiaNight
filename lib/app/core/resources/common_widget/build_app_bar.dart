import 'package:bookdianight_app/app/core/resources/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import '../../extentions/theme_extention.dart';

class BuildAppBar extends StatelessWidget {
  final String title;
  final Widget? backIcon;
  final VoidCallback? onTap;
  final bool? hideBackButton;
  const BuildAppBar({
    super.key,
    required this.title,
    this.backIcon,
    this.onTap,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 32, 0,10,
      ),
      child: Row(
        children: [
          if (hideBackButton == false) ...[
            backIcon ??
                InkWell(
                  onTap:
                      onTap ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Icon(Icons.arrow_back, color: context.iconColor),
                ),
            const SizedBox(width: 16),
          ],
          CustomText(
            text: title,
            color: context.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
