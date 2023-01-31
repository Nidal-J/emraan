import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/constants_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/constants/images_manager.dart';
import '../../core/widgets/loading_widget.dart';
import '../getx/controllers/merchant_home_controller.dart';
import 'merchant_home_tabs/merchant_packages_tab.dart';
import 'merchant_home_tabs/merchant_products_tab.dart';
import 'merchant_home_tabs/merchant_profile_tab.dart';
import 'merchant_home_tabs/merchant_offers_tab.dart';
import 'merchant_home_tabs/merchant_orders_tab.dart';

class MerchantHomeScreen extends GetView<MerchantHomeController> {
  const MerchantHomeScreen({super.key});
  static final List<Widget> _listScreens = [
    const MerchantOrdersTab(),
    const MerchantProductsTab(),
    const MerchantPackagesTab(),
    const MerchantOffersTab(),
    const MerchantProfileTab(),
  ];
  static final List<String> _listTitles = [
    'الطلبات',
    'منتجات',
    'بكجات',
    'عروض',
    'صفحتي',
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(_listTitles[controller.pageIndex.value]),
              leading: IconButton(
                onPressed: () {},
                color: ColorsManager.iconsColor,
                iconSize: 20.r,
                icon: const Icon(Icons.search_outlined),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: IconButton(
                    onPressed: () {},
                    color: ColorsManager.iconsColor,
                    iconSize: 20.r,
                    icon: const Icon(Icons.notification_add_outlined),
                  ),
                ),
              ],
            ),
            body: TopRightRadius(
              child: _listScreens[controller.pageIndex.value],
            ),
            bottomNavigationBar: Container(
              height: 94.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.r),
                ),
                boxShadow: ConstantsManager.customBoxShadow10,
              ),
              child: BottomNavigationBar(
                currentIndex: controller.pageIndex.value,
                onTap: (value) => controller.pageIndex.value = value,
                items: List.generate(
                  5,
                  (index) => BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: SvgPicture.asset(
                        ImagesManager.merchantHomeIcons[index],
                        color: controller.pageIndex.value == index
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        height:
                            controller.pageIndex.value == index ? 24.h : 20.h,
                      ),
                    ),
                    label: _listTitles[index],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: controller.isLoading.value,
            child: const LoadingWidget(),
          ),
        ],
      ),
    );
  }
}
