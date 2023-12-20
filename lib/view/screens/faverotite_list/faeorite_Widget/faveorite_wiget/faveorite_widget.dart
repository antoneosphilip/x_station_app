import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'package:x_station_app/view/screens/electrican_details/eletrician_details_widget/electrician_Details_list/electrician_details_list.dart';

import '../../../category/category_top_text/category_top_text.dart';
import '../../../home/home_widget/home_top_services/home_top_service_list.dart';
import '../faveorite_list_listview/faveoritelist_listview.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         AppBarWidget(text: TextManager.faveoriteList.tr,isArrow: true,),
        SizedBox(height: 43.h,),
        const FavoriteListView(),
      ],
    );
  }
}
