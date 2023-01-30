import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:emraan/core/routes/routes_manager.dart';
import 'package:emraan/core/utils/show_custom_dialog.dart';
import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:emraan/getx/controllers/merchant_app/merchant_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/colors_manager.dart';
import '../../core/constants/constants_manager.dart';
import '../../core/constants/images_manager.dart';
import '../../core/widgets/bill_option.dart';

class MerchantOrderDetailsScreen extends GetView<MerchantOrdersController> {
  const MerchantOrderDetailsScreen({super.key});

  static List<String> reasons = [
    'السبب الأول',
    'السبب الثاني',
    'سبب آخر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('#1122'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          children: [
            Text(
              'المنتجات',
              style: TextStylesManager.title.copyWith(height: 1),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                          padding: EdgeInsets.all(14.r),
                          child: Row(
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
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            Text(
              'الفاتورة',
              style: TextStylesManager.title,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorsManager.cardColor,
                boxShadow: ConstantsManager.customBoxShadow10,
              ),
              child: Column(
                children: const [
                  BillOption(title: 'التوصيل', price: '00'),
                  BillOption(title: 'السعر قبل التخفيض', price: '900'),
                  BillOption(title: 'التخفيض', price: '00'),
                  BillOption(title: 'السعر بعد التخفيض', price: '900'),
                  BillOption(title: 'الضريبة', price: '20'),
                  Divider(),
                  BillOption(
                    title: 'مبلغ النهائي للدفع',
                    price: '920',
                    finalPrice: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.r),
          ),
          color: ColorsManager.white,
          boxShadow: ConstantsManager.customBoxShadow10,
        ),
        child: Obx(
          () => Row(
            children: [
              Expanded(
                child: controller.isAccepted.value
                    ? Container(
                        height: 52.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorsManager.danger.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Text('بانتظار السائق'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _performAcceptOrder(context);
                        },
                        child: const Text('قبول الطلب'),
                      ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                // flex: controller.isAccepted.value ? 9 : 1,
                child: controller.isAccepted.value
                    ? OutlinedButton(
                        onPressed: () {
                          _performRateCustomer();
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: ColorsManager.subtitleColor)),
                        child: Text(
                          'انتقل الى المرحلة التالية',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      )
                    : OutlinedButton(
                        onPressed: () {
                          _performRejectOrder(context);
                        },
                        style: OutlinedButton.styleFrom(
                            alignment: Alignment.center),
                        child: const Text('رفض الطلب'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performAcceptOrder(BuildContext context) async {
    showCustomDialog(
      context: context,
      title: 'حدد موعد التوصيل',
      content: Column(
        children: [
          const TextFieldWidget(
            label: 'تاريخ التوصيل',
            hintText: '16/12/2022',
            prefixIcon: Icon(Icons.date_range_rounded),
          ),
          SizedBox(height: 10.h),
          const TextFieldWidget(
            label: 'وقت التوصيل',
            hintText: '16:30',
            prefixIcon: Icon(Icons.schedule_rounded),
          ),
        ],
      ),
      onConfirm: () {
        Get.back();
        controller.isAccepted(true);
        showSnackbar(message: 'تم تأكيد الطلب بنجاح');
      },
      hasBackButton: false,
    );
    // showDialog(
    //   context: context,
    //   barrierColor: Colors.black.withOpacity(0.5),
    //   builder: (context) => Dialog(
    //     backgroundColor: Colors.transparent,
    //     clipBehavior: Clip.antiAlias,
    //     insetPadding: EdgeInsets.zero,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: ColorsManager.white,
    //         borderRadius: BorderRadius.circular(30.r),
    //       ),
    //       clipBehavior: Clip.antiAlias,
    //       width: double.infinity,
    //       padding: const EdgeInsets.all(20),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             'حدد موعد التوصيل',
    //             style: TextStyle(
    //               fontSize: 20.sp,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(height: 20.h),
    //           const TextFieldWidget(
    //             label: 'تاريخ التوصيل',
    //             hintText: '16/12/2022',
    //             prefixIcon: Icon(Icons.date_range_rounded),
    //           ),
    //           SizedBox(height: 10.h),
    //           const TextFieldWidget(
    //             label: 'وقت التوصيل',
    //             hintText: '16:30',
    //             prefixIcon: Icon(Icons.schedule_rounded),
    //           ),
    //           SizedBox(height: 36.h),
    //           ElevatedButton(
    //             onPressed: () {
    //               Get.back();
    //               showSnackbar(message: 'تم تأكيد الطلب بنجاح');
    //             },
    //             child: const Text('تأكيد'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _performRejectOrder(BuildContext context) {
    showCustomDialog(
      context: context,
      title: 'حدد سبب رفض الطلب',
      content: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10.h);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (index == 2) {
                _addAnotherReason(context);
              } else {
                controller.rejectReasonIndex.value = index;
              }
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 30.w, 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.subtitleColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reasons[index],
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  index == 2
                      ? const Icon(Icons.arrow_forward_ios_rounded)
                      : Obx(() => CircleAvatar(
                            radius: 11.r,
                            backgroundColor: ColorsManager.subtitleColor,
                            child: CircleAvatar(
                              radius: 10.r,
                              backgroundColor:
                                  controller.rejectReasonIndex.value == index
                                      ? ColorsManager.success
                                      : ColorsManager.white,
                            ),
                          )),
                ],
              ),
            ),
          );
        },
      ),
      onConfirm: () {
        Get.back();
        showSnackbar(message: 'تم رفض الطلب');
      },
    );
    // showDialog(
    //   context: context,
    //   barrierColor: Colors.black.withOpacity(0.5),
    //   builder: (context) => Dialog(
    //     backgroundColor: Colors.transparent,
    //     clipBehavior: Clip.antiAlias,
    //     insetPadding: EdgeInsets.zero,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: ColorsManager.white,
    //         borderRadius: BorderRadius.circular(30.r),
    //       ),
    //       clipBehavior: Clip.antiAlias,
    //       width: double.infinity,
    //       padding: const EdgeInsets.all(20),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             'حدد سبب رفض الطلب',
    //             style: TextStyle(
    //               fontSize: 20.sp,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(height: 20.h),
    //           ListView.separated(
    //             shrinkWrap: true,
    //             physics: const NeverScrollableScrollPhysics(),
    //             itemCount: 3,
    //             separatorBuilder: (BuildContext context, int index) {
    //               return SizedBox(height: 10.h);
    //             },
    //             itemBuilder: (BuildContext context, int index) {
    //               return InkWell(
    //                 onTap: () {
    //                   if (index == 2) {
    //                     _addAnotherReason(context);
    //                   } else {
    //                     controller.rejectReasonIndex.value = index;
    //                   }
    //                 },
    //                 child: Container(
    //                   padding: EdgeInsets.fromLTRB(20.w, 16.h, 30.w, 16.h),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10.r),
    //                     border: Border.all(color: ColorsManager.subtitleColor),
    //                   ),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Text(
    //                         reasons[index],
    //                         style: TextStyle(fontSize: 12.sp),
    //                       ),
    //                       index == 2
    //                           // ? IconButton(
    //                           //     onPressed: () {},
    //                           //     padding: EdgeInsets.zero,
    //                           //     alignment: Alignment.centerLeft,
    //                           //     icon: Icon(Icons.arrow_forward_ios_rounded),
    //                           //   )
    //                           ? Icon(Icons.arrow_forward_ios_rounded)
    //                           : Obx(() => CircleAvatar(
    //                                 radius: 11.r,
    //                                 backgroundColor:
    //                                     ColorsManager.subtitleColor,
    //                                 child: CircleAvatar(
    //                                   radius: 10.r,
    //                                   backgroundColor:
    //                                       controller.rejectReasonIndex.value ==
    //                                               index
    //                                           ? ColorsManager.success
    //                                           : ColorsManager.white,
    //                                 ),
    //                               )),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //           SizedBox(height: 36.h),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: ElevatedButton(
    //                   onPressed: () {
    //                     Get.back();
    //                     showSnackbar(message: 'تم رفض الطلب');
    //                   },
    //                   child: const Text('تأكيد'),
    //                 ),
    //               ),
    //               SizedBox(width: 12.w),
    //               Expanded(
    //                 child: OutlinedButton(
    //                   onPressed: () {
    //                     Get.back();
    //                   },
    //                   style:
    //                       OutlinedButton.styleFrom(alignment: Alignment.center),
    //                   child: const Text('إلغاء'),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _addAnotherReason(BuildContext context) {
    showCustomDialog(
      context: context,
      title: 'حدد سبب رفض الطلب',
      content: const TextFieldWidget(
        label: 'اكتب سبب الرفض',
        hintText: 'اكتب هنا ...',
        minLines: 5,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
      ),
      onConfirm: () {
        Get.back();
        Get.back();
        showSnackbar(message: 'تم رفض الطلب');
      },
      backText: 'رجوع',
    );
  }

  _performRateCustomer() {
    Get.toNamed(RoutesManager.customerEvaluationScreen);
  }
}

/*
  Align(
    alignment: Alignment.bottomLeft,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        fixedSize: Size(Get.width / 3, 46.h),
        foregroundColor: ColorsManager.subtitleColor,
        alignment: Alignment.center,
      ),
      child: Text(
        'إلغاء الطلب',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.sp),
      ),
    ),
  ),
*/
