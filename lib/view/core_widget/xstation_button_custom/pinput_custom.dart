import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view_model/block/forget_password_cubit/forget_password_cubit.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 50.h),
      child:  SizedBox(
        width: 350.w,
        height: 50.h,
        child:  Pinput(
          onCompleted: (value){
            ForgetPasswordCubit.get(context).checkCode();

          },
         errorPinTheme: PinTheme(textStyle: TextStyle(color: Colors.red)),
          controller: ForgetPasswordCubit.get(context).pinController,
          length: 4,
          errorTextStyle: TextStyle(color: Colors.red),

        ),
      ),
    );
  }
}
