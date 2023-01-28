import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_manager.dart';
import '../constants/constants_manager.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.storeName,
    required this.productDescription,
    required this.originPrice,
    required this.offerPrice,
    required this.imageUrl,
    this.isFavorite = false,
    this.merchantView = false,
  }) : super(key: key);
  final String storeName;
  final String productDescription;
  final String imageUrl;
  final double originPrice;
  final double offerPrice;
  final bool isFavorite;
  final bool merchantView;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 170.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: ConstantsManager.testBoxShadow1,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                storeName,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Image.asset(
                imageUrl,
                height: 78.h,
                width: 120.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 4.h),
              Text(
                productDescription,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 20.w),
                  Text(
                    offerPrice.toString(),
                    style: TextStyle(
                      fontSize: 8.sp,
                      color: ColorsManager.primary,
                    ),
                  ),
                  Text(
                    'ر.س',
                    style: TextStyle(
                      fontSize: 6.sp,
                      color: ColorsManager.primary,
                    ),
                  ),
                  Visibility(
                    visible: !merchantView,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20.w),
                        Text(
                          originPrice.toString(),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 8.sp,
                            color: ColorsManager.subtitleColor,
                          ),
                        ),
                        Text(
                          'ر.س',
                          style: TextStyle(
                            fontSize: 6.sp,
                            color: ColorsManager.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: !merchantView,
            child: Positioned(
              right: 0,
              top: 4,
              child: IconButton(
                onPressed: () {},
                alignment: Alignment.topRight,
                icon: isFavorite
                    ? Icon(
                        Icons.favorite,
                        color: ColorsManager.danger,
                        size: 18.h,
                      )
                    : Icon(
                        Icons.favorite_border_rounded,
                        color: ColorsManager.iconsColor,
                        size: 18.h,
                      ),
              ),
            ),
          ),
          Visibility(
            visible: !merchantView,
            child: Positioned(
              left: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.primary,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(5.r)),
                  ),
                  padding: EdgeInsets.all(10.r),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: ColorsManager.iconsColor,
                    size: 15.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
