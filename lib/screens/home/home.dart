import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/constants/utils/app_assets.dart';
import 'package:stroll/constants/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: StrollColors.strollBlack,
                boxShadow: [BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 60.r,
                  spreadRadius: 100.r,
                  color: StrollColors.strollBlack,
                ),]
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30.sp, bottom: 40.sp, right: 15.sp, left: 15.sp
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ////////////////////////////////////////////////////////////////////////////////
                    /// TEXT SECTION
                    ///////////////////////////////////////////////////////////////////////////////
                    Row(
                      children: [
                        
                      ],
                    ),
                    
                    // InfluxText(
                    //   text: 'Welcome to Influx',
                    //   fontSize: 32.sp,
                    //   textColor: InfluxColors.influxBlack,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 10.sp,),

                    // SizedBox(
                    //   width: size.width.sp,
                    //   child: InfluxText(
                    //     text: 'Discover, buy, and dive into a world of books. From bestsellers to indie gems, find your next great read right here.',
                    //     fontSize: 16.sp,
                    //     textColor: InfluxColors.influxGreyText,
                    //     fontWeight: FontWeight.w400,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    // SizedBox(height: 30.sp,),

                    // /////////////////////////////////////////////////////////////////////////////////////////
                    // /// BUTTON SECTION
                    // /////////////////////////////////////////////////////////////////////////////////////////
                    // InfluxIconButton(
                    //   onClick: (){
                    //     nextScreen(context, const SelectAccountTypeScreen());
                    //   },
                    //   text: 'Get Started',
                    //   height: 56.sp,
                    //   fontSize: 16.sp,
                    //   width: size.width.sp,
                    //   icon: InfluxAssetsPath.arrowRightIcon,
                    //   textColor: InfluxColors.influxWhite,
                    // ),
                    // SizedBox(height: 15.sp,),

                    // InfluxButton(
                    //   onClick: (){
                    //     nextScreen(context, const LoginScreen());
                    //   },
                    //   text: 'Login',
                    //   height: 56.sp,
                    //   fontSize: 16.sp,
                    //   width: size.width.sp,
                    //   textColor: InfluxColors.influxBlue,
                    //   borderColor: InfluxColors.influxBlue,
                    //   backgroundColor: InfluxColors.influxWhite,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}