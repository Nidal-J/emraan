import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/widgets/customer_category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/routes_manager.dart';

class CustomerCategoriesTab extends StatelessWidget {
  const CustomerCategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 12.w,
      ),
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => Get.toNamed(RoutesManager.productsScreen),
          child: CustomerCategoryCardWidget(
            image: ImagesManager.categories[index],
            title: 'اسم الفئة',
            imageHeight: 100.h,
          ),
        );
      },
    );
  }
}
