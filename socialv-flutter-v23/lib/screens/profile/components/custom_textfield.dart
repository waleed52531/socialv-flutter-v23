import 'package:flutter/material.dart';
import 'package:socialv/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
        required this.placeholder,
        required this.prefixIcon,
        required this.errorEnable,
        required this.keyboardType,
        required this.onChanged,
        this.icon,
        this.controller,
        this.maxlength,
        this.textInputAction,
        this.obscureText,
        this.errorText,
        this.validate,
        this.onSubmitted,
        this.textColor,
        this.onTap,
        this.enable});

  var onChanged;
  final String placeholder;
  final Icon prefixIcon;
  bool errorEnable;

  var icon;
  var keyboardType;
  var controller;
  var maxlength;
  var textInputAction;
  var obscureText;
  var errorText;
  var validate;
  var onSubmitted;
  var textColor;
  var enable;
  var onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: TextFormField(
        onTap: onTap,
        enabled: enable ?? true,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        maxLength: maxlength,
        validator: validate,
        cursorColor: bodyWhite,
        style: TextStyle(color: textColor ?? appBackgroundColorDark, fontSize: 15),
        decoration: InputDecoration(
          prefixIconColor: appColorPrimary,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
          alignLabelWithHint: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: appLayoutBackground),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: appLayoutBackground),
          ),
          labelText: placeholder,
          /*label: Text(controller,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),*/
          labelStyle: const TextStyle(color: appColorPrimary,
          ),
          errorText: errorEnable ? errorText : null,
          suffixIcon: icon,
          prefixIcon: prefixIcon,
          counterText: "",
        ),
      ),
    );
  }
}

