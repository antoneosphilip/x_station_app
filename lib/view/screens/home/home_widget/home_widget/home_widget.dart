
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';

import '../home_app_bar/home_app_bar.dart';
import '../home_services/home_services_list.dart';
import '../home_top_services/home_top_service_list.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h,),
        const HomeAppBar(),
        SizedBox(height: 38.h,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:  EdgeInsets.only(left: 16.w),
              child: const HomeServicesWidget(),
            ),
            SizedBox(height: 50.h,),

            const HomeTopServiceList(),
            SizedBox(height: 16.h,),
            Row(
              children: [
                const Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    Get.toNamed(PageName.postScreen);
                  },
                  backgroundColor: ColorManager.colorPrimary,
                  child:SvgPicture.asset(AssetsImage.plus),
                ),
                SizedBox(width: 31.w,),
                SizedBox(height: 28.h,)
              ],
            ),

          ],
        )
      ],
    );
  }
}
