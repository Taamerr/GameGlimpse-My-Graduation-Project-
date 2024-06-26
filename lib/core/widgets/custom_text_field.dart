import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.hintTextColor,
    this.textColor,
    this.cursorColor,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? cursorColor;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textColor,
      ),
      cursorColor: cursorColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12.0,
        ),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: TAppColors.kGrey2,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
        ),
        //labelText: 'Email Address',
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
