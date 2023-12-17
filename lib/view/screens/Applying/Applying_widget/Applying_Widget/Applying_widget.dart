import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'package:x_station_app/view/screens/Applying/Applying_widget/Applying_form/Applying_form.dart';

class ApplayWidget extends StatelessWidget {
  final String title;
  final String description;
  const ApplayWidget({super.key, required this.title, required this.description});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(text: TextManager.apply.tr,),
         ApplyForm(description: description,title: title),
        SizedBox(
          height: 58.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 197),
          child: Container(
            height: 50.h,
            width: 150.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0Xff63628C)),
            child: Center(
              child: Text(
                TextManager.Applynow.tr,
                style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w600,color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
