import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/screens/category/category_top_text/category_top_text.dart';

import '../category_body/category_body.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryBody();
    // category_top_text();
  }
}
