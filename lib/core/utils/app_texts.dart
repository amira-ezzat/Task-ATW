
import 'package:flutter/material.dart';
import 'package:task_atw/core/utils/app_fonts.dart';

class AppTexts {
  const AppTexts({
    required this.data,
    this.textColor = Colors.white,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaler,
    this.textDecoration,
    this.wordSpacing,
    this.letterSpacing,
  });

  final String data;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? selectionColor;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextScaler? textScaler;
  final TextDecoration? textDecoration;
  final double? wordSpacing, letterSpacing;

  Text _font({required FontWeight fontWeight, required double fontSize}) {
    return Text(
      data,
      softWrap: true,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textScaler: textScaler,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: textColor,
        decoration: textDecoration,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
      ),
    );
  }


  Text bodyBXL() {
    return _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyXL);
  }

  Text bodyML() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyL);
  }

  Text bodySBM() {
    return _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyS);
  }

  Text bodyMS() {
    return _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyM);
  }




}