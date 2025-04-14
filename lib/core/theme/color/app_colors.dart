import 'base_dark_colors.dart';
import 'base_light_colors.dart';
import 'package:flutter/material.dart';

class AppColors {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color gray100(BuildContext context) => isDark(context) ? BaseDarkColors.gray100 : BaseLightColors.gray100;
}
