import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          backgroundColor: InfluxColors.influxMilkyWhite,
          body: SizedBox(
            child: tabOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: CustomBottomAppBar(
            backgroundColor: InfluxColors.influxWhite,
            activeindex: selectedIndex,
            onTabSelected: _selectedTab,
            //color: selectedIndex == 4 ? null : null,
            height: 70.sp,
            selectedColor: selectedIndex == 4 ? null : InfluxColors.influxBlue,
            items: [
              CustomBottomAppBarItem(
                  24.sp, 24.sp, selectedIndex == 0 ? InfluxAssetsPath.homeShadeIcon
                    : InfluxAssetsPath.homeOutlineIcon, "Home",),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, selectedIndex == 1 ? InfluxAssetsPath.bookShadeIcon 
                    : InfluxAssetsPath.bookOutlineIcon, "My Books",),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, selectedIndex == 2 ? InfluxAssetsPath.heartShadeIcon 
                    : InfluxAssetsPath.heartOutlineIcon, "Favourites"),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, selectedIndex == 3 ? InfluxAssetsPath.cartShadeIcon 
                    : InfluxAssetsPath.cartOutlineIcon, "Cart"),
              CustomBottomAppBarItem(
                  24.sp, 24.sp, selectedIndex == 4 ? InfluxAssetsPath.profileShadeIcon
                    : InfluxAssetsPath.profileOutlineIcon, "Account"),
            ],
          ),
        ),
      ),
    );
  }
}