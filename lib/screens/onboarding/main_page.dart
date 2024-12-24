import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/constants/utils/app_assets.dart';
import 'package:stroll/constants/utils/color_constants.dart';
import 'package:stroll/constants/widgets/custom_bottom_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.pageIndex = 0, this.childIndex = 0});
  final int pageIndex;
  final int childIndex; // this is the index of the page with tabs
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  // Get User Data is fetched here at the init state
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.pageIndex;
  }

  bool isKeyboardShowing = false;

  // The tab options and the respective screens
  late List<Widget> tabOptions = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic) {
          if (didPop) {
            return;
          }
        },
        child: Scaffold(
          backgroundColor: StrollColors.strollWhite,
          body: SizedBox(
            child: tabOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: CustomBottomAppBar(
            backgroundColor: StrollColors.strollWhite,
            activeindex: selectedIndex,
            onTabSelected: _selectedTab,
            //color: selectedIndex == 4 ? null : null,
            height: 70.sp,
            selectedColor: selectedIndex == 4 ? null : StrollColors.strollBlue,
            items: [
              CustomBottomAppBarItem(
                  24.sp, 24.sp, StrollAssetsPath.cardsIcon, "",),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, StrollAssetsPath.fireIcon, "",),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, StrollAssetsPath.chatBubbleIcon, ""),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, StrollAssetsPath.userIcon, ""),
            ],
          ),
        ),
      ),
    );
  }
}