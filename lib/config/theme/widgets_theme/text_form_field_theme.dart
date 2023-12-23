import 'package:flutter/material.dart';
import 'package:teka_3dclic/config/theme/app_theme.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static const int focusBorderColor = 2;
  static const int notfocusBorderColor = 3;

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide: BorderSide(width: 2, color: colorList[focusBorderColor])),
      prefixIconColor: colorList[notfocusBorderColor],
      floatingLabelStyle: TextStyle(color: colorList[focusBorderColor]),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29),
          borderSide:
              BorderSide(width: 2, color: colorList[focusBorderColor])));
}
