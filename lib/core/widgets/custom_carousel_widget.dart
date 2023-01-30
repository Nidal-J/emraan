import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/colors_manager.dart';
import '../constants/constants_manager.dart';

class CustomCarouselWidget extends StatelessWidget {
  const CustomCarouselWidget({
    Key? key,
    required this.images,
    required this.bannerIndex,
    required this.bannerController,
    // required this.controller,
  }) : super(key: key);
  final List<String> images;
  final RxInt bannerIndex;
  final PageController bannerController;

  // final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Get.width,
          child: PageView.builder(
            controller: bannerController,
            onPageChanged: (index) {
              bannerIndex(index);
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: Get.width,
                height: 170.h,
                margin: EdgeInsets.only(bottom: 30.h),
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.r)),
                  color: ColorsManager.white,
                  boxShadow: ConstantsManager.customBoxShadow20,
                ),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 10,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: ColorsManager.iconsColor,
              size: 36.r,
            ),
          ),
        ),
        Obx(
          () => Positioned(
            bottom: 35,
            left: 9,
            right: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: bannerIndex.value != 0,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: InkWell(
                    onTap: () {
                      if (bannerIndex.value != 0) {
                        bannerController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      height: 22.r,
                      width: 22.r,
                      margin: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        color: ColorsManager.white,
                        shape: BoxShape.circle,
                        boxShadow: ConstantsManager.customBoxShadow10,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: ColorsManager.primary,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => InkWell(
                      onTap: () => bannerController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                      child: Obx(
                        () => Container(
                          height: 13.r,
                          width: 13.r,
                          margin: EdgeInsets.all(5.r),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: bannerIndex.value == index
                                ? const Border.fromBorderSide(BorderSide.none)
                                : Border.all(color: ColorsManager.iconsColor),
                            color: bannerIndex.value == index
                                ? ColorsManager.primary
                                : ColorsManager.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: bannerIndex.value < 2,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: InkWell(
                    onTap: () {
                      if (bannerIndex.value < 2) {
                        bannerController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Container(
                      height: 22.r,
                      width: 22.r,
                      margin: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        color: ColorsManager.white,
                        shape: BoxShape.circle,
                        boxShadow: ConstantsManager.customBoxShadow10,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: ColorsManager.primary,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
