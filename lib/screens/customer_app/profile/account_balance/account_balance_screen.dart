import 'package:emraan/core/constants/colors_manager.dart';
import 'package:emraan/core/constants/images_manager.dart';
import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/widgets/profile_card_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/customer_app/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AccountBalanceScreen extends GetView<PaymentController> {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('رصيد الحساب'),
      ),
      body: TopRightRadius(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '30',
                    style: TextStyle(
                      fontSize: 128.sp,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      color: ColorsManager.success,
                    ),
                  ),
                  Text(
                    'ر.س',
                    style: TextStyle(
                      fontSize: 24.sp,
                      height: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(height: 30.h),
              Text(
                'البطاقات',
                style: TextStylesManager.title
                    .copyWith(color: ColorsManager.subtitleColor),
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10.h);
                },
                itemBuilder: (BuildContext context, int index) {
                  return _PaymentCard(
                    image: ImagesManager.masterCard,
                    holderName: 'Mohammed Ali',
                    cardNumber: '**********000000', index: index,
                    // defaultCard: controller.cardIndex.value == index,
                  );
                },
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesManager.addPaymentCardScreen);
                },
                child: const Text('إضافة بطاقة جديدة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentCard extends GetView<PaymentController> {
  const _PaymentCard({
    Key? key,
    this.image,
    required this.holderName,
    required this.cardNumber,
    required this.index,
  }) : super(key: key);
  final String? image;
  final String holderName;
  final String cardNumber;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.cardIndex.value = index,
      child: ProfileCardWidget(
        child: Row(
          children: [
            SizedBox(
              width: 60.w,
              child: image != null
                  ? SvgPicture.asset(
                      image!,
                      // 'assets/images/icons/Vector.svg',
                      // color: ColorsManager.primary,
                      fit: BoxFit.none,
                    )
                  : const Icon(Icons.payment_outlined),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                holderName,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ),
            Expanded(
              child: Text(
                cardNumber,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(Icons.more_horiz),
                ),
                Obx(() => CircleAvatar(
                      radius: 13.r,
                      backgroundColor: ColorsManager.dividerColor,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: controller.cardIndex.value == index
                            ? ColorsManager.success
                            : ColorsManager.cardColor,
                      ),
                    )),
                Obx(() => Visibility(
                      visible: controller.cardIndex.value == index,
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: Text(
                        'أساسي',
                        style: TextStyle(
                          fontSize: 6.sp,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
