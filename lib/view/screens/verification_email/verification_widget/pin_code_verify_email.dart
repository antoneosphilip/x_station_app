import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';


class PinPutVerifyEmailWidget extends StatelessWidget {
  const PinPutVerifyEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 50.h),
      child:  SizedBox(
        width: 350.w,
        height: 50.h,
        child:  Pinput(
          onCompleted: (value){
          },
          errorPinTheme: const PinTheme(textStyle: TextStyle(color: Colors.red)),
          controller: SignUpCubit.get(context).codeController,
          length: 4,
          errorTextStyle: const TextStyle(color: Colors.red),

        ),
      ),
    );
  }
}
