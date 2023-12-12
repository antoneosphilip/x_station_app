import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/style_font_manager/style_manager.dart';

class BuildItemCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  final bool isProfile;

  const BuildItemCard(
      {Key? key, required this.image, required this.text, required this.onTap,  this.isProfile=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 358.w,
          height: ScreenUtil().setHeight(48),
          decoration: BoxDecoration(
            color: ColorManager.colorWhite,
            borderRadius: BorderRadius.circular(8.sp),
            boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2), // #000000 with 20% opacity
              blurRadius: 8,
              spreadRadius: 0,
            ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0).w,
            child: Row(
              children: [
                SvgPicture.asset(
                  image,
                  width: ScreenUtil().setWidth(24),
                  height: ScreenUtil().setHeight(24),
                  color: ColorManager.colorXXGrey,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Text(
                  text,
                  style: TextStyleManager.textStyle16w500,

                ),
                Spacer(),
                isProfile? SvgPicture.asset(AssetsImage.arrowRight,color: ColorManager.colorXXGrey,):const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
