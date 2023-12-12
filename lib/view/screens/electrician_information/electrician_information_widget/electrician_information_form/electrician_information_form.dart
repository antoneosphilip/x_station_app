import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class ElectricianInformationForm extends StatelessWidget {
  const ElectricianInformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
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
          Text(
            TextManager.major,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            TextManager.Electrician,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            TextManager.Address,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            TextManager.cairo,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            TextManager.Contact,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            TextManager.phone,
            style: TextStyleManager.textStyle24w500,
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
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
                  style: TextStyleManager.textStyle20600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
