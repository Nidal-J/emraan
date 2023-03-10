import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/top_right_radius.dart';
import '../../../constants/images_manager.dart';
import '../../../widgets/product_card_widget.dart';

class CustomerWishListScreen extends StatelessWidget {
  const CustomerWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('رغباتي'),
      ),
      body: TopRightRadius(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 12.w,
          ),
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              storeName: 'اسم المتجر',
              productDescription: 'خزان مياه حجم 2000لتر',
              originPrice: 500,
              offerPrice: 300,
              imageUrl: ImagesManager.products[index],
              isFavorite: true,
            );
          },
        ),
      ),
    );
  }
}
