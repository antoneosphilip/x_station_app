
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';

import '../home_app_bar/home_app_bar.dart';
import '../home_services/home_services_list.dart';
import '../home_top_services/home_top_service_list.dart';

class HomeTechnicalWidget extends StatelessWidget {
  const HomeTechnicalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h,),
        const HomeAppBar(),
        SizedBox(height: 38.h,),
        Padding(
          padding:  EdgeInsets.only(left: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TextManager.post,style: TextStyleManager.textStyle36w700,),
              SvgPicture.asset(AssetsImage.line,width: 114.w,),
              SizedBox(height: 16.h,),
              const HomeTopServiceList(),
              SizedBox(height: 16.h,),

            ],
          ),
        )
      ],
    );
  }
}
