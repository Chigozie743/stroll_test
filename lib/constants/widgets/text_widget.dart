import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/constants/utils/color_constants.dart';

class StrollText extends StatelessWidget {
  final String text;
  final bool? softWrap;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? textColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  const StrollText({
    super.key,
    required this.text,
    this.height,
    this.softWrap,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
    this.fontFamily = 'U8Regular',
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap ?? true,
      maxLines: maxLines ?? 10,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        height: height,
        fontFamily: fontFamily,
        fontSize: fontSize ?? 22.sp,
        letterSpacing: letterSpacing ?? -0.5.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: textColor ?? StrollColors.strollBlack,
      ),
    );
  }
}
