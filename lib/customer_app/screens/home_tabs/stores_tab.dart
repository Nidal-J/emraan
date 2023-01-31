import 'package:emraan/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/widgets/category_card_widget.dart';

class StoresTab extends StatelessWidget {
  const StoresTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 14.w,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: 9,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.toNamed(RoutesManager.storeScreen),
          child: const CategoryCardWidget(
            image: ImagesManager.logo2,
            title: 'اسم المتجر',
          ),
        );
      },
    );
  }
}
