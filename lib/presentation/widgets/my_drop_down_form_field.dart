import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  final String? selectedItem;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final ValueChanged<String?>?
      onChanged; // == final Function(String?)? onChanged;
  final List<String>? items;
  final String? Function(String?)? validator;
  const MyDropdownButtonFormField({
    Key? key,
    required this.selectedItem,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: DropdownButtonFormField<String>(
        style: TextStyle(
          color: Color(0xff252525),
          fontSize: 16.sp,
        ),
        key: GlobalKey<FormState>(),
        value: selectedItem,
        // icon: Icon(suffixIcon),
        iconSize: 0,
        validator: validator,
        items: items
            ?.map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e.tr()),
              ),
            )
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          enabled: items != null && items!.isNotEmpty,
          contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
          // errorText: 'test',
          // label: Text(label.tr()),
          labelText: label.tr(),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 16.sp,
              color: items != null && items!.isNotEmpty
                  ? Colors.blue
                  : Colors.blue.shade200),
          // prefixIconConstraints: BoxConstraints(maxWidth: 50,maxHeight: 50),
          prefixIcon: Padding(
            padding: EdgeInsets.all(8.w),
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: items != null && items!.isNotEmpty
                  ? Colors.blue
                  : Colors.blue.shade200,
              foregroundColor: Colors.white,
              child: Icon(prefixIcon, size: 25.r),
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: Colors.transparent,
              foregroundColor: items != null && items!.isNotEmpty
                  ? Colors.blue
                  : Colors.blue.shade200,
              child: Material(
                color: Colors.transparent,
                type: MaterialType.circle,
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_down,
                ),
              ),
            ),
          ),

          // suffixIcon: Padding(
          //   padding:EdgeInsets.all(8.0.w),
          //   child: Material(
          //     color: Colors.transparent,
          //     type: MaterialType.circle,
          //     clipBehavior: Clip.antiAlias,
          //     borderOnForeground: true,
          //     elevation: 0,
          //     child: IconButton(
          //
          //       onPressed: () {
          //
          //       },
          //       icon:  Icon(
          //         Icons.visibility_off_outlined,
          //         size: 30.r,
          //       )
          //     ),
          //   ),
          // ),
          // filled: true,
          // fillColor: Color(0xFFF5F5F5),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: Colors.blue),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: Colors.blue.shade200),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ),
    );
  }
}
