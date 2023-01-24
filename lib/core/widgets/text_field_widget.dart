import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isPhone = false,
    this.isEmail = false,
    this.obscureText = false,
    this.readOnly = false,
    this.fullColored = false,
    this.filled = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);
  final String label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isPhone;
  final bool isEmail;
  final bool obscureText;
  final bool readOnly;
  final bool fullColored;
  final bool filled;
  final int maxLines;
  final int minLines;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'هذا الحقل مطلوب';
            } else if (isPassword && value.length < 8) {
              return 'كلمة المرور يجب ألا تقل عن 8 رموز';
            }
            // TODO
            // else if (isEmail && value.length < 6) {
            //   return 'password_condition';
            // }
            // else if (isPhone && value.length < 6) {
            //   return 'password_condition';
            // }
            return null;
          },
          readOnly: readOnly,
          textInputAction: textInputAction,
          keyboardType: isPhone
              ? TextInputType.phone
              : isEmail
                  ? TextInputType.emailAddress
                  : keyboardType,
          obscureText: obscureText,
          // obscuringCharacter: '*',
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChange,
          onFieldSubmitted: onSubmitted,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            filled: filled,
            fillColor: ColorsManager.profileColor,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            hintText: hintText,
            hintStyle: TextStylesManager.subTitle.copyWith(
              color: fullColored
                  ? ColorsManager.primary
                  : ColorsManager.subtitleColor,
            ),
            suffixIcon: suffixIcon,
            // prefixIconConstraints: BoxConstraints(
            //   maxHeight: 24.h,
            //   minHeight: 24.h,
            //   minWidth: 32.h,
            //   maxWidth: 32.h,
            // ),
            prefixIcon: isPassword
                ? Icon(
                    Icons.lock_outline_rounded,
                    color: ColorsManager.subtitleColor,
                    size: 24.r,
                  )
                : isEmail
                    ? Icon(
                        Icons.mail_outline_rounded,
                        color: fullColored
                            ? ColorsManager.primary
                            : ColorsManager.subtitleColor,
                        size: 24.r,
                      )
                    : isPhone
                        ? Transform(
                            transform: Matrix4.rotationY(3.14),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.phone_outlined,
                              color: ColorsManager.subtitleColor,
                              size: 22.r,
                            ),
                          )
                        : prefixIcon,
            errorMaxLines: 2,
            errorStyle: const TextStyle(
              color: ColorsManager.danger,
              // fontSize: 11.sp,
            ),
            // isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      color: fullColored
                          ? ColorsManager.primary
                          : ColorsManager.subtitleColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : const BorderSide(
                      color: ColorsManager.primary,
                    ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : const BorderSide(
                      color: ColorsManager.primary,
                    ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      color: fullColored
                          ? ColorsManager.primary
                          : ColorsManager.subtitleColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : const BorderSide(
                      color: ColorsManager.danger,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
