import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/app/payment_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../core/constants/constants_manager.dart';
import '../../../core/constants/images_manager.dart';

class StoreScreen extends GetView<PaymentController> {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       // bottom: TabBar(
    //       //   tabs: [
    //       //     Tab(text: 'المنتجات'),
    //       //     Tab(text: 'المنتجات'),
    //       //     Tab(text: 'المنتجات'),
    //       //   ],
    //       // ),
    //       title: const Text('Woolha.com Flutter Tutorial'),
    //       backgroundColor: Colors.teal,
    //     ),
    //     body: Column(
    //       children: [
    //         TabBar(
    //           tabs: [
    //             Tab(text: 'المنتجات'),
    //             Tab(text: 'المنتجات'),
    //             Tab(text: 'المنتجات'),
    //           ],
    //         ),
    //         Expanded(
    //           child: TabBarView(
    //             physics: BouncingScrollPhysics(),
    //             dragStartBehavior: DragStartBehavior.down,
    //             children: [
    //               Tab(text: 'المنتجات'),
    //               Tab(text: 'المنتجات'),
    //               Tab(text: 'المنتجات'),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('اسم المتجر'),
        ),
        body: TopRightRadius(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 102.h,
                      width: 108.w,
                      padding: EdgeInsets.all(16.r),
                      margin: EdgeInsets.only(left: 8.w),
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: ConstantsManager.customBoxShadow20,
                      ),
                      child: Image.asset(
                        ImagesManager.logo,
                        color: ColorsManager.primary,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اسم المتجر',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'شارع العليا، العليا، Al akaria #2, 5th floor, الرياض 11564، المملكة العربية السعودية',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.w),
                              SvgPicture.asset(ImagesManager.address),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const TabBar(
                  labelColor: ColorsManager.primary,
                  unselectedLabelColor: ColorsManager.subtitleColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: 'المنتجات'),
                    Tab(text: 'الفئات'),
                    Tab(text: 'بكجات'),
                    Tab(text: 'العروض'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
