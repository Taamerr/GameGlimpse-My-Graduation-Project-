import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.fillColor,
    this.textColor = TAppColors.kGrey2,
    this.controller,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController? controller;
  final Color? textColor;
  final String hintText;
  final Color? fillColor;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      style: TextStyle(
        color: textColor,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 16.h),
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle:  TextStyle(
          color: TAppColors.kGrey2,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
