
import 'package:flutter/material.dart';
class AppColor{

  static const Color kGrey1 = Color(0xffF7F9FF);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color kGrey2 = Color(0xffF9FAFB);
  static const Color kGrey3 = Color(0xffE8F3F1);
  static const Color kText1 = Color(0xff101623);
  static const Color kText2 = Color(0xff717784);
  static const Color kText3 = Color(0xffA1A8B0);
  static const Color backgroundColor100 = Color(0xFFe1dee0);

  static const Color successColor = Color(0xFF08b12d);
  static const Color errorColor = Color(0xFFe81e1e);
  static const Color indigoColor = Color(0xFF8968CD);

}
ThemeMode themeMode = ThemeMode.system;
changeMode(bool dark)
{
  dark? themeMode = ThemeMode.dark : ThemeMode.light;
}

