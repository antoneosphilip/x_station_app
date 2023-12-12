import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import 'home_services_item.dart';

class HomeServicesWidget extends StatelessWidget {
  const HomeServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 113.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return  const HomeServicesItem();
          },
          separatorBuilder: (context,index){
            return SizedBox(width: 16.w,);
          },
          itemCount: 10
      ),
    );
  }
}
