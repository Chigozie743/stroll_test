import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/constants/utils/app_assets.dart';
import 'package:stroll/constants/utils/color_constants.dart';
import 'package:stroll/constants/widgets/text_widget.dart';
import 'package:stroll/screens/home/home_widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = -1;

  List<String> optionsList = ['A', 'B', 'C', 'D'];

  List<String> answerList = ['The peace in the early mornings', 
    'The magical golden hours', 'Wind-down time after dinners', 
    'The serenity past midnight'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              StrollAssetsPath.homeBackgroundImage,
            ),
            fit: BoxFit.fill
          )
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ////////////////////////////////////////////////////////////////////////////////
              /// FIRST PHASE: TOP PART
              ///////////////////////////////////////////////////////////////////////////////
              Column(
                children: [
                  SizedBox(height: 40.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShadowText(
                        data: 'Stroll Bonfire',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 10.sp,),

                      Icon(
                        Icons.expand_more,
                        color: StrollColors.strollBlueText,
                        size: 30.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const RowAndTextWidget(
                        text: '22h 00m',
                        icon: StrollAssetsPath.clockIcon,
                      ),
                      SizedBox(width: 15.sp,),
                      const RowAndTextWidget(
                        text: '103',
                        icon: StrollAssetsPath.userIcon,
                      )
                    ],
                  ),
                ],
              ),

              ////////////////////////////////////////////////////////////////////////////////
              /// SECOND PHASE: BOTTOM PART
              ///////////////////////////////////////////////////////////////////////////////
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: StrollColors.strollBlack,
                  boxShadow: [BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 50.r,
                    spreadRadius: 60.r,
                    color: StrollColors.strollBlack,
                  ),]
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0.sp, bottom: 40.sp, right: 20.sp, left: 20.sp
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ////////////////////////////////////////////////////////////////////////////////
                      /// TEXT SECTION
                      ///////////////////////////////////////////////////////////////////////////////
                      const ProfileInfoWidget(
                        question: 'What is your favorite time of the day?',
                        quote: '“Mine is definitely the peace in the morning.”',
                        image: StrollAssetsPath.picsImage,
                        name: 'Angelina',
                        age: '28',
                      ),
                      SizedBox(height: 20.sp,),

                      SizedBox(
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 20.sp,
                              runSpacing: 20.sp,
                              children: [
                                ...List.generate(optionsList.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                    child: QuestionOptionWidget(
                                      option: optionsList[index],
                                      answer: answerList[index],
                                      outerBorderColor: index == _currentIndex 
                                        ? StrollColors.strollBlue 
                                        : StrollColors.transparentColor,
                                      innerBorderColor: index == _currentIndex 
                                        ? StrollColors.transparentColor 
                                        : StrollColors.strollWhite,
                                      innerBoxColor: index == _currentIndex 
                                        ? StrollColors.strollBlue 
                                        : StrollColors.transparentColor,
                                    ),
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.sp,),

                      StrollText(
                        text: 'Pick your option. \nSee who has a similar mind.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        textColor: StrollColors.strollWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      ////////////////////////////////////////////////////////////////////
      /// FLOATING ACTION BUTTON
      ////////////////////////////////////////////////////////////////////
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: CircleBorder(
              side: BorderSide(
                width: 2.sp,
                color: StrollColors.strollBlue,
              )
            ),
            backgroundColor: StrollColors.transparentColor,
            onPressed: (){},
            child: SvgPicture.asset(
              StrollAssetsPath.microphoneIcon,
              height: 30.sp,
              width: 30.sp,
            ),
          ),
          SizedBox(width: 10.sp,),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: StrollColors.strollBlue,
            onPressed: (){},
            child: Icon(
              Icons.arrow_forward,
              size: 32.sp,
            ),
          ),
        ]
      ),
    );
  }
}