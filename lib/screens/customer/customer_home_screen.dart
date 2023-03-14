import '../../constants/colors_manager.dart';
import '../../constants/constants_manager.dart';
import '../../getx/controllers/customer/customer_home_controller.dart';
import '../../routes/routes_manager.dart';
import '../../widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/images_manager.dart';
import '../../widgets/loading_widget.dart';
import 'customer_home_tabs/customer_home_tab.dart';
import 'customer_home_tabs/customer_orders_tab.dart';
import 'customer_home_tabs/customer_profile_tab.dart';
import 'customer_home_tabs/customer_stores_tab.dart';

class CustomerHomeScreen extends GetView<CustomerHomeController> {
  const CustomerHomeScreen({super.key});
  static final List<Widget> _listScreens = [
    const CustomerHomeTab(),
    const CustomerStoresTab(),
    const CustomerOrdersTab(),
    const CustomerProfileTab(),
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
                    onPressed: () {},
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
                      ),
                    ),
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
