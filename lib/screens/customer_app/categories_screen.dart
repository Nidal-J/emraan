import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/widgets/category_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفئات'),
      ),
      body: TopRightRadius(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 12.w,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Get.toNamed(RoutesManager.productsScreen),
              child: CategoryCardWidget(
                image: ImagesManager.categories[index],
                title: 'اسم الفئة',
                imageHeight: 100.h,
              ),
            );
          },
        ),
      ),
    );
  }
}
