import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors_manager.dart';

class VerifyFieldWidget extends StatelessWidget {
  const VerifyFieldWidget({
    Key? key,
    required this.codeController,
    required this.focusNode,
    required this.onChanged,
    required this.filled,
    this.autofocus = false,
  }) : super(key: key);

  final TextEditingController codeController;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final bool filled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: codeController,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 24.sp,
        height: 1.4,
        color: filled ? ColorsManager.white : ColorsManager.titleColor,
      ),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      maxLength: 1,
      cursorColor: filled ? ColorsManager.white : ColorsManager.primary,
      cursorHeight: 36.h,
      cursorRadius: const Radius.circular(5),
      autofocus: autofocus,
      decoration: InputDecoration(
        counterText: '',
        filled: filled,
        fillColor: ColorsManager.primary,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        // isDense: true,
        // isCollapsed: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: ColorsManager.subtitleColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorsManager.subtitleColor),
        ),
      ),
    );
  }
}
