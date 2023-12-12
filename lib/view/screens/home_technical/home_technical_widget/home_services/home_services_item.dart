import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_manager/assets_manager.dart';

class HomeServicesItem extends StatelessWidget {
  const HomeServicesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256.w,
      height: 113.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: Image.asset(AssetsImage.testHome,fit: BoxFit.cover,),
    );
  }
}
