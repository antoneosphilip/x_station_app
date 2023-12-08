import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/electrican_details/eletrician_details_widget/electrician_Details_list/electrician_details_list.dart';

import '../../../category/category_top_text/category_top_text.dart';
import '../../../home/home_widget/home_top_services/home_top_service_list.dart';

class ElectricianDetailsWidget extends StatelessWidget {
  const ElectricianDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CategoryTopText(text: TextManager.electrician),
        SizedBox(height: 29.5.h,),
        const ElectricianDetailsList(),
      ],
    );
  }
}
