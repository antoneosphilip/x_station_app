import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 17.w),
      child: Row(
        children: [
          SvgPicture.asset(AssetsImage.menu,width: 50.w,height: 50.w,fit: BoxFit.cover),
          Expanded(
            child: TextFormFieldCustom(
              validate: (value){},
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.search),
            ),
          ),
        ],
      ),
    );
  }
}
