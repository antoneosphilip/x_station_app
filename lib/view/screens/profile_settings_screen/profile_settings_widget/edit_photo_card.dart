import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';

class EditPhotoCard extends StatelessWidget {
  const EditPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AppBarWidget(
            text: TextManager.profileSetting.tr,
            height: 200,
            rightPadding: 80,
          ),
          Positioned(
            left: 120.w,
            top: 135.h,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70.sp,
                  backgroundImage: const NetworkImage(
                      'https://i.pinimg.com/564x/cc/dd/67/ccdd67e4c60b5aa952b30321e0a14a19.jpg'),
                ),
                Positioned(
                  left: 55.w,
                  top: 110.h,
                  child: InkWell(
                    onTap: () {
                      print('--------add photo-----------------');
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: ColorManager.colorWhite),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          AssetsImage.addPhoto,
                          width: 40.w,
                          height: 30.h,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
