import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
          onTap: () {
            Get.toNamed(PageName.fullNotifictionScreen);
          },
          child: Container(
            width: 360.w,
            decoration: BoxDecoration(
                color: ColorManager.colorXXWhite,
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 66.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                      color: ColorManager.colorXGrey,
                      borderRadius: BorderRadius.circular(35.r)),
                  child: Text("XS",
                      style: TextStyleManager.textStyle36w700
                          .copyWith(color: ColorManager.colorPrimary)),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextManager.appName,
                        style: TextStyleManager.textStyle14w700.copyWith(
                            color: ColorManager.colorPrimary),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "loream",
                        style: TextStyleManager.textStyle10w400.copyWith(color: ColorManager.colorBlack.withOpacity(.65),fontWeight: FontWeight.w700),
                      )
                    ],
                  )),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 34, right: 15),
                child: Text(
                  "hours ago",
                  style: TextStyleManager.textStyle10w400.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ]),
          )),
    );
  }
}
