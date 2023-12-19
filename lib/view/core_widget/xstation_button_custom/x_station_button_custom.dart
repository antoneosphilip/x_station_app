import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/screens/verification/verification_screen/verification_screen.dart';

import '../../../core/assets_manager/assets_manager.dart';
import '../../../core/color_manager/color_manager.dart';
import '../../../core/text_manager/text_manager.dart';
import '../elevated_button/elevated_button_custom.dart';

class XStationButtonCustom extends StatelessWidget {
  final String textButton;
  final   Function onPressed;

  const XStationButtonCustom({super.key,  this.textButton=TextManager.next,required this.onPressed,  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
      onPressed: onPressed!,
      // onPressed: (){
      //        final A = MaterialPageRoute(builder: (context) =>(verification_screen()));
      //       Navigator.push(context, A);
          
      // },
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(textButton!,style: const TextStyle(color: Colors.white),),
          SizedBox(width: 11.w,),
        ],
      ),
      colors: ColorManager.colorPrimary,
    );
  }
}
