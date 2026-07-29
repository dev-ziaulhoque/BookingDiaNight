import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../extentions/theme_extention.dart';
import '../app_colors/App_Colors.dart';
import 'custom_text.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? focusColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool readOnly;
  final TextStyle? style;
  final bool obscureText;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final bool? filled;
  final Color? fillColor;
  final Color? hintColor;
  final Color? labelColor;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool isBorder;
  final bool? enabled;
  final double? height;

  const CustomTextField({
    super.key,
    required this.hint,
    this.label,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.focusColor,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.style,
    this.borderRadius = 12.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.filled,
    this.fillColor,
    this.hintColor,
    this.labelColor,
    this.errorText,
    this.validator,
    this.isBorder = true,
    this.enabled,
    this.height,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget? _buildLabel() {
    if (widget.label == null || widget.label!.trim().isEmpty) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CustomText(
        text: widget.label!,
        color: widget.labelColor ?? AppColors.textColor(context),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: widget.isBorder
          ? BorderSide(
        color: widget.borderColor ?? AppColors.borderColor(context),
        width: widget.borderWidth,
      )
          : BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasLabel = _buildLabel() != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) _buildLabel()!,
        widget.height != null
            ? SizedBox(
          height: widget.height,
          child: _buildTextField(),
        )
            : _buildTextField(),
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: _obscureText,
      cursorColor: Colors.white, // cursor color jeta pointer
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      enableInteractiveSelection: true,
      style: widget.style ??
          GoogleFonts.poppins(
            color: context.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
      decoration: InputDecoration(
        filled: widget.filled ?? (widget.fillColor != null),
        fillColor: widget.fillColor ?? context.inputColor,
        hintText: widget.hint,
        hintStyle: GoogleFonts.poppins(
          color: widget.hintColor ?? Colors.grey,
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: context.iconColor,
          ),
          onPressed: _toggleVisibility,
        )
            : widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.focusColor ?? AppColors.mainColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        errorText: widget.errorText,
        errorStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 12),
        errorMaxLines: 2,
      ),
      validator: widget.validator,
    );
  }
}