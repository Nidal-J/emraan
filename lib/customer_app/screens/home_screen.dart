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
import '../getx/controllers/home_controller.dart';
import 'home_tabs/home_tab.dart';
import 'home_tabs/orders_tab.dart';
import 'home_tabs/profile_tab.dart';
import 'home_tabs/stores_tab.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  static final List<Widget> _listScreens = [
    const HomeTab(),
    const StoresTab(),
    const OrdersTab(),
    const ProfileTab(),
  ];
  static final List<String> _listTitles = [
    'الرئيسية',
    'المتاجر',
    'طلباتي',
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
              leadingWidth: 90.w,
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(RoutesManager.cartScreen);
                    },
                    visualDensity: VisualDensity.compact,
                    color: ColorsManager.iconsColor,
                    iconSize: 20.r,
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      // Get.to(() => const TestScreen());
                    },
                    visualDensity: VisualDensity.compact,
                    color: ColorsManager.iconsColor,
                    iconSize: 20.r,
                    icon: const Icon(Icons.search_outlined),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: IconButton(
                    onPressed: () =>
                        Get.toNamed(RoutesManager.notificationsScreen),
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
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: SvgPicture.asset(
                        ImagesManager.home,
                        color: controller.pageIndex.value == 0
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        height: 20.h,
                      ),
                    ),
                    // icon: Icon(Icons.home_outlined),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: SvgPicture.asset(
                        ImagesManager.stores,
                        color: controller.pageIndex.value == 1
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        height: 20.h,
                      ),
                    ),
                    // icon: Icon(Icons.store_outlined),
                    label: 'المتاجر',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: SvgPicture.asset(
                        ImagesManager.orders,
                        color: controller.pageIndex.value == 2
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        height: 20.h,
                      ),
                    ),
                    // icon: Icon(Icons.menu_open_outlined),
                    label: 'طلباتي',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: SvgPicture.asset(
                        ImagesManager.person,
                        color: controller.pageIndex.value == 3
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        height: 20.h,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    // icon: Icon(Icons.person_outline_rounded),
                    label: 'صفحتي',
                  ),
                ],
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
