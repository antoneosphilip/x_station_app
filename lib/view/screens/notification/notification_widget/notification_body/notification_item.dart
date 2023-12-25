import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/home/home_widget/home_post_item_Details/home_post_details_Screen/home_post_Details_Screen.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';

class NotificationItem extends StatelessWidget {
  final String message;
  final String date;
  final int id;
  final String imagePerson;

  const NotificationItem({super.key, required this.message, required this.date, required this.id, required this.imagePerson});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('HH').format(now);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: InkWell(
          onTap: () {
            Get.to(HomePostDetailsScreen(id: id,imagePerson: imagePerson,));
          },
          child: Container(
            width: 360.w,
            decoration: BoxDecoration(
                color:ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorXXWhite,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
                children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 66.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                      color: ProfileCubit.get(context).isDark?ColorManager.colorDark:ColorManager.colorWhiteDarkMode,
                      borderRadius: BorderRadius.circular(35.r)),
                  child: Text("XS",
                      style: TextStyleManager.textStyle36w700
                          .copyWith(color: ColorManager.colorPrimary)),
                ),
              ),
              Expanded(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextManager.appName,
                          style: TextStyleManager.textStyle14w700.copyWith(
                              color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorPrimary,),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${message.toString()}",
                          style: TextStyleManager.textStyle10w400.copyWith(color:
                          ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:
                          ColorManager.colorBlack.withOpacity(.65),fontWeight: FontWeight.w700),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 34, right: 15),
                child: Text(
                  "${formattedDate} hours ago",
                  style: TextStyleManager.textStyle10w400.copyWith(fontWeight: FontWeight.w700,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack),
                ),
              ),
            ]),
          )),
    );
  }
}
