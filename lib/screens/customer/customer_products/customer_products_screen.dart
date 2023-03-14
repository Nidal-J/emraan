import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/images_manager.dart';
import '../../../widgets/product_card_widget.dart';

class CustomerProductsScreen extends StatelessWidget {
  const CustomerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اسم الفئة'),
      ),
      body: TopRightRadius(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 12.w,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 8,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Get.toNamed(RoutesManager.productDetailsScreen),
              child: ProductCard(
                storeName: 'اسم المتجر',
                productDescription: 'خزان مياه حجم 2000لتر',
                originPrice: 500,
                offerPrice: 300,
                imageUrl: ImagesManager.products[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
