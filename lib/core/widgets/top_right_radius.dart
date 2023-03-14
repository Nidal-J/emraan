import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/colors_manager.dart';

class TopRightRadius extends StatelessWidget {
  const TopRightRadius({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            border: Border.all(
              color: ColorsManager.primary,
              width: 0.5,
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(60.r)),
            border: Border.all(
              color: ColorsManager.white,
              width: 0.5,
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
