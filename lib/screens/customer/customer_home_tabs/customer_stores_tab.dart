import 'package:emraan/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/images_manager.dart';
import '../../../widgets/customer_category_card_widget.dart';

class CustomerStoresTab extends StatelessWidget {
  const CustomerStoresTab({super.key});

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
          onTap: () => Get.toNamed(RoutesManager.customerStoreScreen),
          child: const CustomerCategoryCardWidget(
            image: ImagesManager.logo2,
            title: 'اسم المتجر',
          ),
        );
      },
    );
  }
}
