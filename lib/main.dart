import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stroll/constants/utils/color_constants.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 950,
        watch: 300,
      ),
      builder: (context, sizeInfo) {
        return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: sizeInfo.deviceScreenType == DeviceScreenType.mobile 
              ? const Size(430, 932) 
              : const Size(744, 1133),
            builder: (context, child) {
            return MaterialApp(
              title: 'Stroll',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(useMaterial3: true).copyWith(
                dividerTheme: const DividerThemeData(
                  color: Colors.transparent,
                ),
                datePickerTheme: const DatePickerThemeData(
                  headerBackgroundColor: StrollColors.strollBlue,
                ),
                scaffoldBackgroundColor: StrollColors.strollWhite,
                iconTheme: const IconThemeData(
                  color: StrollColors.strollIconColor,
                ),
                cardColor: StrollColors.strollWhite,
                brightness: Brightness.light,
                colorScheme: ThemeData().colorScheme.copyWith(
                      secondary: StrollColors.strollGrey,
                      brightness: Brightness.light,
                ),
              ),
              home: Container(),
            );
          }
        );
      }
    );
  }
}

