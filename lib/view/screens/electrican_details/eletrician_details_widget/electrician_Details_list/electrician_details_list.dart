import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../electrician_details_item/electrician_details_item.dart';


class ElectricianDetailsList extends StatelessWidget {
  const ElectricianDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return const ElectricianDetailsItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 14.h);
        },
        itemCount: 10
    );
  }
}
