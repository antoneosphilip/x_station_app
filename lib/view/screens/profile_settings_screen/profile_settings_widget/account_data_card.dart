import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import 'change_password_card.dart';
import 'delete_account_card.dart';
import 'user_data_card.dart';

class AccountDataCard extends StatelessWidget {
  const AccountDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextManager.account.tr,
            style: TextStyleManager.textStyle20w700.copyWith(color: ColorManager.colorXXGrey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const UserDataCard(),
          ),
          Text(
            TextManager.address.tr,
            style: TextStyleManager.textStyle16w500,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10.h),
          //   child:  const AddressCard(),
          // ),
          ChangePasswordCard(),
        ],
      ),
    );
  }
}
