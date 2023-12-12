import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'package:x_station_app/view/core_widget/xstation_button_custom/x_station_button_custom.dart';
import 'package:x_station_app/view/screens/Posting/Posting_widgett/Posting_Form/Posting_form.dart';

class PostingWidget extends StatelessWidget {
  const PostingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const AppBarWidget(text: TextManager.posting,),
        SizedBox(
          height: 46.h,
        ),
        const PostingForm(),
        SizedBox(
          height: 190.h,
        ),
        XStationButtonCustom(onPressed: (){},
        textButton: TextManager.Applynow,
        )
      ],
    );
  }
}
