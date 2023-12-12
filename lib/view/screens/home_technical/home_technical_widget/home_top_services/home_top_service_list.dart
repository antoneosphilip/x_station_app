import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_top_service_item.dart';

class HomeTopServiceList extends StatelessWidget {
  const HomeTopServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return const HomeTopServiceItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 16.h);
        },
        itemCount: 3
    );
  }
}
