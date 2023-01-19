import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_crew/feature/core/theme/color/color_manager.dart';
import 'package:my_crew/feature/core/theme/size/size_manager.dart';
import 'package:my_crew/utils/utils/utils.dart';


class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {Key? key,
      required this.controller,
      required this.label,
      this.color,
      this.obscureText = false,
      this.maxLines = 1,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.onTap,
      this.keyboardType,
      this.prefixIcon,
      this.hint,
      this.maxLength,
      this.digitsOnly = false,})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final Color? color;
  final bool obscureText;
  final int maxLines;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool digitsOnly;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    Utils.instance.screenUtil(context: context);
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      inputFormatters: <TextInputFormatter>[
        if (keyboardType == TextInputType.number && digitsOnly) ...[
          FilteringTextInputFormatter.digitsOnly
        ],
      ],
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
        alignLabelWithHint: true,
        label: Text(label),
        labelStyle: Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w500,
              color: color ?? Theme.of(context).textTheme.headline1?.color,
            ),
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: color ?? Theme.of(context).textTheme.headline1?.color,
              )
            : null,
        suffixIconColor: color ?? Theme.of(context).textTheme.headline1?.color,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(
                color: color ?? Theme.of(context).textTheme.headline1!.color!)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(
                color: color ?? Theme.of(context).textTheme.headline1!.color!)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(color: ColorManager.instance.error)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(
                color: ColorManager.instance.colorPrimary , width: 1.8)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeManager.r16),
            borderSide: BorderSide(
                color: color ?? Theme.of(context).textTheme.headline1!.color!)),
      ),
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w500,
            color: color ?? Theme.of(context).textTheme.headline1?.color,
          ),
      validator: validator,
    );
  }
}
