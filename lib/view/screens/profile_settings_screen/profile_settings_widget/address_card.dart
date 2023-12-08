import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';


import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/elevated_button/elevated_button_custom.dart';


class AddressCard extends StatefulWidget {
  const AddressCard({super.key});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width:ScreenUtil().scaleWidth,
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),

      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      // height: ScreenUtil().setHeight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: ColorManager.colorWhite,
        boxShadow: const [
          BoxShadow(
              blurRadius: 2,
              color: ColorManager.colorGrey,
              offset: Offset(0, 0),
              spreadRadius: 1)
        ],
      ),
      child: Column(
        children: [
          // TextFormFieldCustom(
          //   validate: (String? value) {
          //     if (value!.isEmpty) {
          //       return 'Filed Required';
          //     }
          //     return null;
          //   },
          //   boarderColor: ColorManager.colorPrimary,
          //   suffixIcon: Padding(
          //     padding: EdgeInsets.all(8.sp),
          //     child: SvgPicture.asset(AssetsManager.EDIT),
          //   ),
          //   hint: '95, Opposite Arjun College, Kairav Plot, Township No. 21',
          //   suffix: true,
          // ),
          Container(
            height: 150.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ).r,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Container(
            height: 50.h,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: const BorderRadius.only(
            //     bottomLeft: Radius.circular(20),
            //     bottomRight: Radius.circular(20),
            //   ).r,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       blurRadius: 3,
            //       spreadRadius: 3,
            //       offset: const Offset(0, 3),
            //     ),
            //   ],
            // ),
            child: ElevatedButtonCustom(
              colors: ColorManager.colorWhite,
              width: 200.w,
              height: 60.h,
              borderColor: ColorManager.colorPrimary,
              radius: 8,
              widget: Row(
                children: [
                  Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.sp),
                        border: Border.all(
                            color: ColorManager.colorPrimary, width: 2.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.r),
                        child: SvgPicture.asset(
                          AssetsImage.addPhoto,
                          color: ColorManager.colorPrimary,
                        ),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    TextManager.address.tr,
              style: TextStyleManager.textStyle16w500,
                  ),
                ],
              ),
              onPressed: () {

              },
            ),
          )
        ],
      ),
    );
  }

}
