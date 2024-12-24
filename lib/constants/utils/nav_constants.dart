import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

////////////////////////////////////////////////////////////////////////////////////
// This is for smooth routing or transition. Rather than jumping, we made use of
// the PageTransition package.
////////////////////////////////////////////////////////////////////////////////////

void nextScreen(context, page) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}


///************** NAVIGATOR POP FUNCTION *********/
void nextPop(context, page) {
  Navigator.pop(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}
