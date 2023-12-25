import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';

import 'order_list.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const AppBarWidget(text: TextManager.orderList,isArrow: false,),
        SizedBox(height: 20.h,),
        const OrderList(),

      ],
    );
  }
}
