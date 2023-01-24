import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_manager.dart';
import '../constants/constants_manager.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: ColorsManager.cardColor,
        boxShadow: ConstantsManager.customBoxShadow10,
      ),
      child: child,
    );
  }
}
