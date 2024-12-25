import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/constants/utils/app_assets.dart';
import 'package:stroll/constants/utils/color_constants.dart';
import 'package:stroll/constants/widgets/text_widget.dart';

class RowAndTextWidget extends StatelessWidget {
  const RowAndTextWidget({
    required this.text,
    required this.icon,
    super.key});

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          icon,
          height: 18.sp,
          width: 18.sp,
          color: StrollColors.strollWhite,
        ),
        SizedBox(width: 7.sp,),

        Column(
          children: [
            SizedBox(height: 5.sp,),
            StrollText(
              text: text,
              fontSize: 14.sp,
              textColor: StrollColors.strollWhite,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
}


////////////////////////////////////////////////////////////////////////
/// PROFILE INFO WIDGET
////////////////////////////////////////////////////////////////////////
class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    required this.question,
    required this.quote,
    required this.image,
    required this.name,
    required this.age,
    super.key});

  final String question;
  final String quote;
  final String image;
  final String name;
  final String age;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.sp,
              height: 60.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(width: 20.sp,),
        
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StrollText(
                  text: '$name, $age',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: StrollColors.strollWhite,
                ),
                SizedBox(height: 10.sp,),
        
                SizedBox(
                  width: 275.sp,
                  child: StrollText(
                    text: question,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    textColor: StrollColors.strollWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.sp,),

        Row(
          children: [
            SizedBox(width: 50.sp,),
            StrollText(
              text: quote,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              textColor: StrollColors.strollGreyText,
            ),
          ],
        ),
      ],
    );
  }
}


//////////////////////////////////////////////////////////////////////////
/// QUESTIONS OPTION WIDGET
/////////////////////////////////////////////////////////////////////////
class QuestionOptionWidget extends StatelessWidget {
  const QuestionOptionWidget({
    required this.option,
    required this.answer,
    this.innerBorderColor,
    this.outerBorderColor,
    this.innerBoxColor,
    super.key});

  final String option;
  final String answer;
  final Color? innerBoxColor;
  final Color? outerBorderColor;
  final Color? innerBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182.sp,
      decoration: BoxDecoration(
        color: const Color(0xFF232A2E), 
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: outerBorderColor 
          ?? StrollColors.transparentColor)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp, vertical: 15.sp
        ),
        child: Row(
          children: [
            Container(
              width: 25.sp,
              height: 25.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: innerBoxColor ?? StrollColors.transparentColor,
                border: Border.all(color: innerBorderColor 
                  ?? StrollColors.strollLightGreyText)
              ),
              child: Center(
                child: StrollText(
                  text: option,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  textColor: StrollColors.strollLightGreyText,
                ),
              ),
            ),
            SizedBox(width: 10.sp,),

            SizedBox(
              width: 123.sp,
              child: StrollText(
                text: answer,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                textColor: StrollColors.strollLightGreyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//////////////////////////////////////////////////////////////////////////
/// SHADOW TEXT WIDGET
/////////////////////////////////////////////////////////////////////////
class ShadowText extends StatelessWidget {
  const ShadowText({super.key, 
    required this.style, 
    required this.data}) : assert(data != null);

  final String? data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 2.0,
            child: Text(
              data!,
              style: style!.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: StrollText(
              text: data!,
              fontSize: 37.sp,
              textColor: StrollColors.strollBlueText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}