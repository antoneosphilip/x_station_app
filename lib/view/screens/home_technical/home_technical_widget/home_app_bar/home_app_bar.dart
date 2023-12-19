import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/view/screens/notification/notification_screen/notification_screen.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../utility/database/local/cach_data.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi,${CachingDataManager.instance.getLoginModel().data!.name}",style: TextStyleManager.textStyle24w500.copyWith(fontWeight: FontWeight.w700,fontSize: 20),),
                    SizedBox(height: 28.h,),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(width: 14.w,),
              InkWell(
                  onTap: (){
                  },
                  child: SvgPicture.asset(AssetsImage.notification,fit: BoxFit.cover,color: ColorManager.colorBlack,height: 25.h,)),
              SizedBox(width: 14.w,),
              const CircleAvatar(
                radius: 28,
                backgroundImage: CachedNetworkImageProvider('https://th.bing.com/th/id/OIP.Ghae4OEdb4UmC3hkqpFvLAHaGd?rs=1&pid=ImgDetMain'),
              ),
              SizedBox(width: 16.w,)
            ],
          ),

          Row(
            children: [
              Expanded(
                child: TextFormFieldCustom(
                  validate: (value){},
                  suffix: true,
                  suffixIcon: SvgPicture.asset(AssetsImage.search),
                ),
              ),
              SizedBox(width: 16.w,)
            ],
          ),
        ],
      ),
    );
  }
}
