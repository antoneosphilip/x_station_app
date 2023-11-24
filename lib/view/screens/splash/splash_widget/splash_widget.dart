import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

import '../../../../core/route_manager/page_name.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();

}

class _SplashWidgetState extends State<SplashWidget> {

  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();
  }
  navigateToLogin() async{
    await Future.delayed(const Duration(milliseconds: 5000),(){});
    Get.toNamed(PageName.onBoarding);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 800.h,
     decoration: const BoxDecoration(
       gradient: LinearGradient(colors: GradiantLinearColor.primaryGradiant)
     ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(TextManager.appName,style: TextStyleManager.textStyle24w300.copyWith(color: ColorManager.colorWhite,fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}
