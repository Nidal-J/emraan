import 'package:emraan/core/utils/show_snackbar.dart';
import 'package:emraan/core/widgets/text_field_widget.dart';
import 'package:emraan/core/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors_manager.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة منتج'),
      ),
      body: TopRightRadius(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          physics: const BouncingScrollPhysics(),
          children: [
            const TextFieldWidget(
              label: 'اسم المنتج',
              hintText: 'اسم المنتج',
            ),
            const TextFieldWidget(
              label: 'التفاصيل',
              hintText: 'اكتب هنا ...',
              maxLines: 5,
              minLines: 5,
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary.withOpacity(0.5),
                foregroundColor: ColorsManager.black,
                elevation: 0,
              ),
              child: const Text('استيراد  صورة'),
            ),
            Text(
              'الحد الأقصى لارفاق الصور عدد 5',
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(height: 20.h),
            const Text('حدد الفئة'),
            Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.subtitleColor),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: Container(),
                value: 'test1',
                hint: const Text('اختار الفئة'),
                items: const [
                  DropdownMenuItem(
                    value: 'test1',
                    child: Text('اختار الفئة'),
                  ),
                  DropdownMenuItem(
                    value: 'test2',
                    child: Text('السعة'),
                  ),
                  DropdownMenuItem(
                    value: 'test3',
                    child: Text('الحجم'),
                  ),
                ],
                onChanged: (gender) {},
              ),
            ),
            SizedBox(height: 4.h),
            const Text('اكتب احجام السعة والسعر لكل حجم'),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const TextFieldWidget(
                        hintText: 'اكتب هنا ...',
                      ),
                      Container(
                        height: 55.r,
                        width: 55.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsManager.primary,
                        ),
                        child: const Text(
                          'م2',
                          style: TextStyle(color: ColorsManager.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40.w),
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const TextFieldWidget(
                        hintText: 'اكتب هنا ...',
                      ),
                      Container(
                        height: 55.r,
                        width: 55.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsManager.primary,
                        ),
                        child: const Text(
                          'م2',
                          style: TextStyle(color: ColorsManager.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(Get.width / 3, 46.h),
                  foregroundColor: ColorsManager.primary,
                ),
                child: Text(
                  'إضافة سعة آخرى',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 22.h),
            const TextFieldWidget(
              label: 'الكمية المتوفرة من المنتج',
              hintText: '00',
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {
                Get.back();
                showSnackbar(message: 'شكرا لك، تم إضافة ملاحظتك بنجاح');
              },
              child: const Text('تأكيد'),
            ),
          ],
        ),
      ),
    );
  }
}
