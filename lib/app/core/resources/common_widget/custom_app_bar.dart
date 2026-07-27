// ignore_for_file: prefer_const_constructors

import 'package:bookdianight_app/app/core/resources/common_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors/App_Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  final Color? textColor;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool forceMaterialTransparency;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? leading;
  final double? toolbarHeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.fontSize,
    this.centerTitle = true,
    this.backgroundColor,
    this.forceMaterialTransparency = true,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading,
    this.toolbarHeight, this.textColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: forceMaterialTransparency,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      title: CustomText(
        text: title,
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.w500,
        color: textColor ?? Colors.white,
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading ?? GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(left: 10),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.1),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      elevation: forceMaterialTransparency ? 0 : null,
    );
  }
}