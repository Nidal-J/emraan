import '../../constants/colors_manager.dart';
import '../../constants/constants_manager.dart';
import '../../constants/images_manager.dart';
import '../../getx/controllers/customer/customer_payment_controller.dart';
import '../../widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'customer_store_tabs/customer_categories_tab.dart';
import 'customer_store_tabs/customer_offers_tab.dart';
import 'customer_store_tabs/customer_packages_tab.dart';
import 'customer_store_tabs/customer_products_tab.dart';

class CustomerStoreScreen extends GetView<CustomerPaymentController> {
  const CustomerStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('اسم المتجر'),
        ),
        body: TopRightRadius(
          child: Padding(
            padding: EdgeInsets.only(top: 44.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 102.h,
                      width: 108.w,
                      padding: EdgeInsets.all(16.r),
                      margin: EdgeInsets.only(left: 8.w, right: 20.w),
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
                              SvgPicture.asset(
                                ImagesManager.address,
                                height: 24.h,
                              ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const TabBar(
                  padding: EdgeInsets.all(10),
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
                Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: ConstantsManager.customBoxShadow20,
                  ),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorsManager.white,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      hintText: 'ابحث عن ...',
                      hintStyle: TextStyle(
                        color: ColorsManager.iconsColor,
                        fontSize: 10.sp,
                      ),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: ColorsManager.iconsColor,
                        size: 24.r,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      CustomerProductsTab(),
                      CustomerCategoriesTab(),
                      CustomerPackagesTab(),
                      CustomerOffersTab(),
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
