import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';

class HomeTopServiceItem extends StatelessWidget {
  const HomeTopServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      height: 100.h,
      child: Row(
        children: [
          SizedBox(width: 8.w,),
          Container(
              width: 96.w,
              height: 96.w,
              decoration: BoxDecoration(
                color: ColorManager.colorXGrey,
                borderRadius: BorderRadius.circular(35.w),
              ),
              child: Center(child: SvgPicture.asset(AssetsImage.clean,))
          ),
          SizedBox(width: 16.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("deep cleaning",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack,fontWeight: FontWeight.w400),),
              SizedBox(height: 10.h,),
              Text("15 \$ / hr",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorDarkBlue),),
              SizedBox(height: 8.h,),
              Text("4.5",style: TextStyleManager.textStyle14w500.copyWith(color: ColorManager.colorLightBlack),),
            ],
          ),
          const Spacer(),
          Padding(
            padding:  EdgeInsets.only(bottom: 57.14.h),
            child: SvgPicture.asset(AssetsImage.heart),
          ),
          SizedBox(width: 33.2.w,)
        ],
      ),
    );
  }
}
