import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors_manager.dart';
import '../../getx/controllers/orders_controller.dart';

class OrdersTab extends GetView<OrdersController> {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 44.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _OrderStatus(0, 'كل الطلبات', ColorsManager.primary),
              _OrderStatus(1, 'تحت المعالجة', ColorsManager.warning),
              _OrderStatus(2, 'مكتملة', ColorsManager.success),
              _OrderStatus(3, 'ملغى', ColorsManager.danger),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: ColorsManager.cardColor,
                    boxShadow: ConstantsManager.customBoxShadow20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: ColorsManager.white,
                        ),
                        child: Image.asset(
                          ImagesManager.products[2],
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '#1225',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '500',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorsManager.primary,
                                    ),
                                  ),
                                  Text(
                                    'ر.س',
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: ColorsManager.primary,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.more_horiz),
                                ],
                              ),
                              Row(
                                children: [
                                  const _OrderStatus(
                                    -1,
                                    'تحت المعالجة',
                                    ColorsManager.warning,
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => Get.toNamed(
                                        RoutesManager.orderDetailsScreen),
                                    child: Text(
                                      'تفاصيل الطلب ',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 16.r,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderStatus extends GetView<OrdersController> {
  const _OrderStatus(
    this.index,
    this.text,
    this.color, {
    Key? key,
  }) : super(key: key);
  final int index;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pageIndex(index);
      },
      child: Obx(
        () => AnimatedContainer(
          padding: EdgeInsets.symmetric(
              horizontal: controller.pageIndex.value == index ? 16.w : 4.w),
          // margin: EdgeInsets.only(left: index != 3 ? 16.w : 0),
          alignment: Alignment.center,
          height: 28.h,
          constraints: BoxConstraints(minWidth: 60.w),
          decoration: BoxDecoration(
            color: controller.pageIndex.value == index
                ? color
                : color.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10.r),
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          child: Text(
            text,
            style: TextStyle(
              color: controller.pageIndex.value == index
                  ? ColorsManager.white
                  : ColorsManager.subtitleColor,
              fontSize: 12.sp,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
