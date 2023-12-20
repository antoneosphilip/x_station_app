import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class MessageText extends StatelessWidget {
  const MessageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 34.h, bottom: 3.h, left: 28.w,right: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextManager.message.tr,
              style: TextStyleManager.textStyle24w300.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 7.h,
            ),
            SvgPicture.asset((AssetsImage.line),width: 105.w,),
          ],
        ));
  }
}
