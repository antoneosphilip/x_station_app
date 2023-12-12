import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/elevated_button/elevated_button_custom.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';

import '../../../../../core/color_manager/color_manager.dart';

class PostingForm extends StatelessWidget {
  const PostingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 12.w,right: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.type,
                style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 22.h,),
              TextFormFieldCustom(validate: (value){},
              maxLines: 10,
                hint: TextManager.writeSomeThing,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h,),
        ElevatedButtonCustom(
          borderColor: ColorManager.colorXXWhite,
          onPressed: (){}!,
          // onPressed: (){
          //        final A = MaterialPageRoute(builder: (context) =>(verification_screen()));
          //       Navigator.push(context, A);

          // },
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(TextManager.Addattachment!,style: TextStyleManager.textStyle20600.copyWith(fontWeight: FontWeight.w300),),
              SizedBox(width: 11.w,),
            ],
          ),
          colors: ColorManager.colorXXWhite,
        )
      ],
    );
  }
}
