import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/color_manager/color_manager.dart';

class BuildIotItem extends StatelessWidget {
  final bool isIndex;

  const BuildIotItem({super.key, required this.isIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: isIndex?ColorManager.colorDarkBlue:ColorManager.colorPrimary,
      ),
    );
  }
}
