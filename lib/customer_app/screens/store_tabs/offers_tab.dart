import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/widgets/product_card_widget.dart';

class OffersTab extends StatelessWidget {
  const OffersTab({super.key});

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
        return ProductCard(
          storeName: 'اسم المتجر',
          productDescription: 'خزان مياه حجم 2000لتر',
          originPrice: 500,
          offerPrice: 300,
          imageUrl: ImagesManager.products[index],
        );
      },
    );
  }
}
