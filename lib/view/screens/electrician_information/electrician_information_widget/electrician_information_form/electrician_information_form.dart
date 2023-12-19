import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class ElectricianInformationForm extends StatelessWidget {
  final String address;
  final String phone;
  final String email;

  const ElectricianInformationForm({super.key, required this.address, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextManager.details,
            style: TextStyleManager.textStyle36ow900.copyWith(fontSize: 30.sp),
          ),
          const Divider(
            thickness: 3,
            color: Color(0Xff1F1B93),
            endIndent: 204,
          ),
          SizedBox(
            height: 29.h,
          ),
          Row(
            children: [
              Text(
                TextManager.Email,
                style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp),
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                email,
                style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp,color: ColorManager.colorPrimary),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.Address,
                style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp),
              ),
              SizedBox(
                height: 11.h,
              ),
              Expanded(
                child: Text(
                  address,
                  style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp,color: ColorManager.colorPrimary),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Text(
                TextManager.Contact,
                style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp),
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                phone,
                style: TextStyleManager.textStyle20600.copyWith(fontSize: 19.sp,color: ColorManager.colorPrimary),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          InkWell(
            onTap: ()async {
             await FlutterPhoneDirectCaller.callNumber(phone);
              // final Uri phoneLaunchUri = Uri(
              //   scheme: 'tel',
              //   path: "${phone}",
              // );
              // if(await canLaunchUrl(phoneLaunchUri)){
              //   await
              //
              // }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 199),
              child: Container(
                height: 50.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color(0Xff63628C)),
                child: Center(
                  child: Text(
                    TextManager.contractme,
                    style: TextStyleManager.textStyle20600White.copyWith(fontSize: 19.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
