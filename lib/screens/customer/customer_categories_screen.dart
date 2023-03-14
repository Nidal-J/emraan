import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/top_right_radius.dart';
import '../../routes/routes_manager.dart';
import '../../constants/images_manager.dart';
import '../../widgets/customer_category_card_widget.dart';

class CustomerCategoriesScreen extends StatelessWidget {
  const CustomerCategoriesScreen({super.key});

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
              child: CustomerCategoryCardWidget(
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
