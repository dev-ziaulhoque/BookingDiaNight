import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import '../../extentions/theme_extention.dart';
import '../app_colors/App_Colors.dart';
import 'custom_text.dart';

class CustomDropDownWidget extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintText;
  final String? label;
  final ValueChanged<String?>? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? focusColor;
  final Color? fillColor;
  final bool? filled;
  final Color? dropDownColor;
  final Color? labelColor;
  final Color? hintColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? iconWidget;
  final double? iconSize;
  final bool isExpanded;
  final double? itemHeight;
  final double? menuMaxHeight;
  final bool isBorder;
  final String? errorText;

  const CustomDropDownWidget({
    super.key,
    required this.items,
    required this.hintText,
    this.label,
    this.selectedValue,
    this.onChanged,
    this.onTap,
    this.validator,
    this.height,
    this.width,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.borderColor,
    this.focusedBorderColor,
    this.focusColor,
    this.fillColor,
    this.filled,
    this.dropDownColor,
    this.labelColor,
    this.hintColor,
    this.textStyle,
    this.hintStyle,
    this.iconWidget,
    this.iconSize,
    this.isExpanded = true,
    this.itemHeight,
    this.menuMaxHeight,
    this.isBorder = true,
    this.errorText,
  });

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    // ডাইনামিক হাইট ক্যালকুলেশন (প্রতিটি আইটেমের জন্য আনুমানিক ৪৮ পিক্সেল + প্যাডিং)
    final double calculatedHeight = (widget.items.length * 48.0) + 20.0;
    // সর্বোচ্চ হাইট লিমিট (স্ক্রিনের ৬০%)
    final double maxAllowedHeight = widget.menuMaxHeight ?? (screenHeight * 0.6);
    // চূড়ান্ত হাইট (যাতে আইটেম কম থাকলে ছোট থাকে এবং বেশি থাকলে লিমিট ক্রস না করে)
    final double finalOverlayHeight = calculatedHeight > maxAllowedHeight ? maxAllowedHeight : calculatedHeight;

    final bool hasLabel = widget.label != null && widget.label!.trim().isNotEmpty;

    String? initialValue = widget.selectedValue;
    if (initialValue != null && !widget.items.contains(initialValue)) {
      initialValue = null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        if (hasLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomText(
              text: widget.label!,
              color: widget.labelColor ?? AppColors.textColor(context),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        FormField<String>(
          initialValue: initialValue,
          validator: widget.validator,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  width: widget.width ?? double.infinity,
                  height: widget.height ?? 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: widget.isBorder
                        ? Border.all(
                      color: state.hasError
                          ? Colors.red
                          : (widget.borderColor ?? AppColors.borderColor(context)),
                      width: widget.borderWidth,
                    )
                        : null,
                    color: (widget.filled == true || widget.fillColor != null)
                        ? (widget.fillColor ?? context.inputColor)
                        : Colors.transparent,
                  ),
                  child: DropdownFlutter(
                    items: widget.items,
                    initialItem: initialValue,
                    hintText: widget.hintText,

                    // ডাইনামিক হাইট সেট করা হলো
                    overlayHeight: finalOverlayHeight,

                    onChanged: (value) {
                      state.didChange(value);
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
                    closedHeaderPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    itemsListPadding: const EdgeInsets.symmetric(vertical: 8),
                    listItemPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.transparent,
                      expandedFillColor: widget.dropDownColor ?? AppColors.backgroundColor(context),
                      closedSuffixIcon: widget.iconWidget ?? Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: widget.iconSize ?? 24,
                        color: AppColors.iconColor(context),
                      ),
                      expandedSuffixIcon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: widget.iconSize ?? 24,
                        color: AppColors.iconColor(context),
                      ),
                      hintStyle: widget.hintStyle ?? GoogleFonts.poppins(
                        color: widget.hintColor ?? Colors.grey,
                        fontSize: 14,
                      ),
                      headerStyle: widget.textStyle ?? GoogleFonts.poppins(
                        color: AppColors.textColor(context),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      listItemStyle: widget.textStyle ?? GoogleFonts.poppins(
                        color: AppColors.textColor(context),
                        fontSize: 14,
                      ),
                      closedBorderRadius: BorderRadius.circular(widget.borderRadius),
                      expandedBorderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),
                ),
                if (state.hasError || widget.errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0, left: 16.0),
                    child: Text(
                      widget.errorText ?? state.errorText ?? '',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}