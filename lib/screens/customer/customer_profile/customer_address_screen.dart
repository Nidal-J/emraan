import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/images_manager.dart';
import '../../../widgets/top_right_radius.dart';

class CustomerAddressScreen extends StatelessWidget {
  const CustomerAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العنوان'),
      ),
      body: TopRightRadius(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesManager.map),
              fit: BoxFit.cover,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('تحديث العنوان'),
          ),
        ),
      ),
    );
  }
}
