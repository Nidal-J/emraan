import 'package:emraan/constants/images_manager.dart';
import 'package:emraan/routes/routes_manager.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/colors_manager.dart';

class CustomerNotificationsScreen extends StatelessWidget {
  const CustomerNotificationsScreen({super.key});

  static List<Map> notifications = [
    {
      'title': 'تم دفع مبلغ 500 ر.س قيمة فاتور رقم #000',
      'type': 'payment',
      'accepted': true,
    },
    {
      'title': 'تم دفع مبلغ 500 ر.س قيمة فاتور رقم #000',
      'type': 'payment',
      'accepted': true,
    },
    {
      'title': 'تم وصول طلبك رقم #0011',
      'type': 'order',
      'accepted': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('الإشعارات'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 44.h),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => Get.toNamed(
                    RoutesManager.customerNotificationsStatusScreen),
                child: Container(
                  color: notifications[index]['accepted']
                      ? ColorsManager.primary.withOpacity(0.2)
                      : Colors.transparent,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    leading: Container(
                      height: 40.r,
                      width: 40.r,
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorsManager.shadow10,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        notifications[index]['type'] == 'payment'
                            ? ImagesManager.payment
                            : ImagesManager.trucktor,
                        fit: BoxFit.contain,
                        color: ColorsManager.primary,
                      ),
                    ),
                    title: Text(
                      notifications[index]['title'],
                      style: TextStyle(fontSize: 10.sp),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: ColorsManager.diabled,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
