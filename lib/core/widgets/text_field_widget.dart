import 'package:emraan/core/constants/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.label,
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
    this.isValidated = true,
    this.multiLines = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
  }) : super(key: key);
  final String? label;
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
  final bool isValidated;
  final bool multiLines;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Text(label ?? ''),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if ((value == null || value.trim().isEmpty) && isValidated) {
              return 'هذا الحقل مطلوب *';
            } else if (isPassword && value!.length < 8) {
              return 'كلمة المرور يجب ألا تقل عن 8 رموز *';
            } else if (isEmail &&
                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!)) {
              return 'تأكد من إدخال إيميل صالح *';
            } else if (isPhone && value!.length < 8) {
              return 'تأكد من إدخال رقم جوال صالح *';
            }
            return null;
          },
          readOnly: readOnly,
          textInputAction:
              multiLines ? TextInputAction.newline : textInputAction,
          keyboardType: isPhone
              ? TextInputType.phone
              : isEmail
                  ? TextInputType.emailAddress
                  : multiLines
                      ? TextInputType.multiline
                      : keyboardType,
          obscureText: obscureText,
          maxLines: multiLines ? 5 : maxLines,
          minLines: multiLines ? 5 : minLines,
          onChanged: onChange,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          textAlignVertical: TextAlignVertical.center,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText: '',
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
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      color: fullColored
                          ? ColorsManager.primary
                          : ColorsManager.subtitleColor,
                    ),
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
