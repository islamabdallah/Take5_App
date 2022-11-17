import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final String? errorText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnPressed;
  final int? maxLines;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextFormField({
    Key? key,
    required this.label,
    this.errorText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixOnPressed,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16.sp,
        ),
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorText:errorText,
          labelText: label.tr(),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          // prefixIconConstraints: BoxConstraints(maxWidth: 50,maxHeight: 50),
          prefixIcon: Icon(prefixIcon, size: 30.r),
          suffixIcon: suffixIcon != null
              ? Material(
                color: Colors.transparent,
                type: MaterialType.circle,
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed:suffixOnPressed,
                  iconSize: 30.r,
                  icon: Icon(suffixIcon),
                ),
              )
              : null,

          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.mainColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.red),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
