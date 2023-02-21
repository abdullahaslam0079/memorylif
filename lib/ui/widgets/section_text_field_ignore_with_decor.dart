
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/ui/base/base_widget.dart';

import '../../constant/style.dart';


typedef ValueChanged<T> = void Function(T value);
typedef FormFieldValidator<T> = String? Function(T? value);

class SectionFieldDecor extends BaseStateLessWidget {
  final String hintText;
  final bool? obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  SectionFieldDecor(
      {required this.hintText,
      this.obscureText,
      this.controller,
      this.readOnly = false,
      this.onChanged,
      this.validator,
      this.onTap,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(dimens.k15)),
      padding: EdgeInsets.symmetric(vertical: dimens.k8),
      constraints: BoxConstraints(maxHeight: dimens.k150),
      child: TextFormField(
        cursorColor: Style.primaryColor,
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        validator: validator,
        readOnly: true,
        onTap: onTap,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        style: context.textTheme.subtitle2
            ?.copyWith(color: Style.primaryColor, fontWeight: FontWeight.w500, fontSize: dimens.k15, fontFamily: 'Raleway'),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.subtitle2?.copyWith(color: Style.primaryColor, fontWeight: FontWeight.w500, fontFamily: 'Raleway'),
            isDense: false,
            filled: true,
            fillColor: Style.cardColor,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '',
                    style: context.textTheme.subtitle2
                        ?.copyWith(color: Style.primaryColor, fontWeight: FontWeight.w500, fontSize: dimens.k15, fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
            errorStyle: context.textTheme.subtitle2?.copyWith(color: Style.accentColor, fontWeight: FontWeight.w500, fontFamily: 'Raleway'),
            errorBorder: kOutlineInputBorder(),
            enabledBorder: kOutlineInputBorder(),
            focusedBorder: kOutlineInputBorder(color: Style.primaryColor),
            border: kOutlineInputBorder()),
      ),
    );
  }

  kOutlineInputBorder({Color? color}) =>
      OutlineInputBorder(borderSide: BorderSide(color: color ?? Style.cardColor), borderRadius: BorderRadius.circular(dimens.k15));
}
