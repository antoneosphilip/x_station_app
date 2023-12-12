import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/view/screens/electrician_information/electrician_information_widget/electrician_information_form/electrician_information_form.dart';

import '../electrician_information_form/upload.dart';

class ElectricianInformationWidget extends StatelessWidget {
  const ElectricianInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            color: const Color(0Xff63628C),
          ),
          child: SizedBox(
            height: 340.h,
            width: 360.w,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18, top: 19),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: SvgPicture.asset(
                          AssetsImage.arrowLeft,
                          color: ColorManager.colorPrimary,
                          width: 6.w,
                          height: 12.h,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 21, top: 27),
                      child: SvgPicture.asset(
                        AssetsImage.heart2,
                        width: 43.w,
                        height: 36.h,
                      ),
                    ),
                  ],
                ),
                const Upload()
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        const ElectricianInformationForm(),
      ],
    );
  }
}
