import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? inputType;
  final bool initial;
  final String? initialText;
  final bool isObscure;
  final bool alignRight;
  final ValueChanged<String?>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? suffixWidget;
  final BoxConstraints? suffixConstraints;
  final bool isEnabled;
  final bool readOnly;
  final bool needAutoValidate;
  final int maxLines;
  final Function(String)? onSubmitedValue;
  final bool isNeedAutoFocus;

  const DefaultTextField({
    Key? key,
    required this.hintText,
    this.onSaved,
    this.controller,
    this.labelText,
    this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText,
    this.isObscure = false,
    this.alignRight = false,
    this.onChanged,
    this.validator,
    this.suffixWidget,
    this.suffixConstraints,
    this.isEnabled = true,
    this.readOnly = false,
    this.needAutoValidate = false,
    this.maxLines = 1,
    this.onSubmitedValue,
    this.isNeedAutoFocus = false,
  }) : super(key: key);

  // listInputType
  // 0 : text
  // 1 : multiline
  // 2 : number
  // 3 : phone
  // 4 : datetime
  // 5 : emailAddress
  // 6 : url
  // 7 : visiblePassword
  // 8 : name
  // 9 : streetAddress
  // 10 : none

  List<TextInputFormatter> get _inputFormatters {
    List<TextInputFormatter> _formatters = <TextInputFormatter>[];
    switch (inputType?.index) {
      case 2:
        _formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 3:
        _formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        _formatters.add(FilteringTextInputFormatter.allow(RegExp(" ")));
        break;
      case 9:
        break;
    }
    return _formatters;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      readOnly: readOnly,
      autofocus: isNeedAutoFocus,
      controller: controller,
      onChanged: onChanged ?? (value) {},
      onFieldSubmitted: onSubmitedValue,
      textAlign: alignRight ? TextAlign.end : TextAlign.start,
      cursorColor: AppColors.primaryDark,
      initialValue: initialText,
      keyboardType: inputType,
      inputFormatters: _inputFormatters,
      obscureText: isObscure,
      style: AppTextStyle.textSmall,
      maxLines: maxLines,
      autovalidateMode: needAutoValidate ? AutovalidateMode.always : null,
      decoration: InputDecoration(
        focusColor: AppColors.primaryDark,
        hoverColor: AppColors.lightGreyDark.withOpacity(0.7),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: AppColors.primaryDark),
        ),
        hintText: hintText,
        hintStyle: AppTextStyle.textSmall.copyWith(
          color: AppColors.darkGreyLightest,
        ),
        labelText: labelText,
        labelStyle: AppTextStyle.textSmall.copyWith(
          color: AppColors.darkGreyLightest,
        ),
        floatingLabelStyle: AppTextStyle.textSmall.copyWith(
          color: AppColors.primaryDark,
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: suffixWidget,
        suffixIconConstraints: suffixConstraints,
      ),
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved ?? (value) {},
    );
  }
}
