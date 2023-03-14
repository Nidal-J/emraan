import 'package:emraan/utils/show_snackbar.dart';
import 'package:emraan/widgets/text_field_widget.dart';
import 'package:emraan/widgets/top_right_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/colors_manager.dart';

class MerchantAddPackageScreen extends StatelessWidget {
  const MerchantAddPackageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة بكج'),
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
                icon: const Icon(Icons.keyboard_arrow_down),
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
                    child: Text('الفئة 1'),
                  ),
                  DropdownMenuItem(
                    value: 'test3',
                    child: Text('الفئة 2'),
                  ),
                ],
                onChanged: (gender) {},
              ),
            ),
            SizedBox(height: 10.h),
            const Text('حدد الوحدة'),
            Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: ColorsManager.subtitleColor),
              ),
              child: DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down),
                isExpanded: true,
                underline: Container(),
                value: 'test1',
                hint: const Text('اختر الوحدة'),
                items: const [
                  DropdownMenuItem(
                    value: 'test1',
                    child: Text('اختر الوحدة'),
                  ),
                  DropdownMenuItem(
                    value: 'test2',
                    child: Text('الفئة 1'),
                  ),
                  DropdownMenuItem(
                    value: 'test3',
                    child: Text('الفئة 2'),
                  ),
                ],
                onChanged: (gender) {},
              ),
            ),
            SizedBox(height: 10.h),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                const TextFieldWidget(
                  label: 'سعر البكج',
                  hintText: '00',
                ),
                Container(
                  height: 55.r,
                  width: 70.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorsManager.primary,
                  ),
                  child: const Text(
                    'ر.س',
                    style: TextStyle(color: ColorsManager.white),
                  ),
                ),
              ],
            ),
            Divider(height: 30.h),
            const TextFieldWidget(
              label: 'اسم المنتج',
              hintText: 'اسم المنتج',
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary.withOpacity(0.5),
                foregroundColor: ColorsManager.black,
                elevation: 0,
              ),
              child: const Text('استيراد  صورة  المنتج'),
            ),
            Text(
              'الحد الأقصى لارفاق الصور عدد 1',
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                const Text('العدد'),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.success),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: ColorsManager.success,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    2.toString(),
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.danger),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: ColorsManager.danger,
                    ),
                  ),
                ),
              ],
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
                          'ر.س',
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
            const TextFieldWidget(
              label: 'الكمية المتوفرة من المنتج',
              hintText: '00',
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
                  'إضافة منتج آخر',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                Get.back();
                showSnackbar(message: 'شكرا لك، تم إضافة البكج بنجاح');
              },
              child: const Text('إضافة البكج'),
            ),
          ],
        ),
      ),
    );
  }
}
