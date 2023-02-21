
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';
import 'package:memorylif/constant/style.dart';
import 'package:memorylif/ui/base/base_widget.dart';

class SectionTextFieldDecor extends BaseStateLessWidget {
  final String hintText;
  final bool? obscureText;
  final bool readOnly;
  final bool? asHint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Color filledColor;
  final Color? labelTextColor;
  final int maxLines;
  final Widget? suffixIcon;
  BoxDecoration? decoration;
  final bool underlineBorder;
  final bool autoFocus;
  final AutovalidateMode? validateMode;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  TextAlignVertical? textAlignVertical;
  SectionTextFieldDecor(
      {required this.hintText,
      this.obscureText,
      this.underlineBorder = false,
      this.autoFocus = false,
      this.validateMode,
      this.asHint = false,
      this.controller,
      this.inputFormatters,
      this.decoration,
      this.textAlign,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.suffixIcon,
      this.textAlignVertical,
      this.maxLines = 1,
      this.readOnly = false,
      this.onChanged,
      this.labelTextColor,
      this.validator,
      this.filledColor = Colors.transparent,
      this.onTap,
      this.keyboardType,
      this.textInputAction,
      this.focusNode,
      this.prefixIcon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // decoration = null;
    return Container(
      // decoration: decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(dimens.k15)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(dimens.k5)),
      // padding: decoration == null ? EdgeInsets.symmetric(vertical: dimens.k8) : EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: dimens.k8),

      constraints: BoxConstraints(maxHeight: dimens.k150),
      child: TextFormField(
        cursorColor: Style.primaryColor,
        controller: controller,
        textAlignVertical: textAlignVertical,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        maxLines: maxLines,
        autovalidateMode: validateMode ?? AutovalidateMode.disabled,
        validator: validator,
        autofocus: autoFocus,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        autocorrect: false,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        style: context.textTheme.subtitle2?.copyWith(
            color: Style.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: dimens.k15,
            fontFamily: 'Raleway'),
        decoration: InputDecoration(
            label: Text(
              hintText,
              textAlign: textAlign ?? TextAlign.start,
            ),
            hintText: asHint! ? hintText : null,
            labelStyle: context.textTheme.subtitle2?.copyWith(
                color: labelTextColor ?? Style.primaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway'),
            hintStyle: asHint!
                ? context.textTheme.subtitle2?.copyWith(
                    color: labelTextColor ?? Style.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Raleway')
                : null,
            isDense: true,
            floatingLabelBehavior: floatingLabelBehavior,
            filled: true,
            alignLabelWithHint: false,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: filledColor,
            errorMaxLines: 1,
            errorStyle: context.textTheme.subtitle2?.copyWith(
                color: Style.primaryColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway'),
            errorBorder: underlineBorder
                ? kUnderLineInputBorder()
                : kOutlineInputBorder(),
            enabledBorder: underlineBorder
                ? kUnderLineInputBorder()
                : kOutlineInputBorder(),
            focusedBorder: underlineBorder
                ? kUnderLineInputBorder(color: Style.primaryColor)
                : kOutlineInputBorder(color: Style.primaryColor),
            border: underlineBorder
                ? kUnderLineInputBorder()
                : kOutlineInputBorder()),
      ),
    );
  }

  kOutlineInputBorder({Color? color}) => OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Style.whiteColor),
      borderRadius: BorderRadius.circular(dimens.k5));
}

kUnderLineInputBorder({Color? color, double? borderWidth = 2}) =>
    UnderlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Style.whiteColor,
        width: borderWidth!,
      ),
    );
