import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';

class DeleteAccountWidget extends StatelessWidget {
  DeleteAccountWidget({Key? key}) : super(key: key);
  TextEditingController currentPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        // height: 60.h,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              TextManager.deleteAccount.tr,
              style: TextStyleManager.textStyle16w500.copyWith(color: Colors.red),

            ),
          ],
        ),
      ),
    );
  }
}
