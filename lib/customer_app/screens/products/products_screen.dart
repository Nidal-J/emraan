import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/widgets/product_card_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
