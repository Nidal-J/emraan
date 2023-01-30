import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_manager.dart';
import '../constants/constants_manager.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key? key,
    required this.image,
    this.imageHeight,
    required this.title,
  }) : super(key: key);
  final String image;
  final double? imageHeight;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h,
      width: 108.w,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: ConstantsManager.customBoxShadow20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: imageHeight ?? 56.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
