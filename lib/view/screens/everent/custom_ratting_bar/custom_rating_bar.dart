import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';

class CustomRattingBar extends StatelessWidget {
  const CustomRattingBar({
    super.key,
    this.width = 300,
    this.height = 100,
    this.size = 10,
    this.onRatingUpdate,
    this.initRate = 3,
    this.ignoreGesture = false,
    this.color=ColorManager.colorPrimary,
  });

  final double width;
  final double height;
  final double size;
  final Function? onRatingUpdate;
  final double initRate;
  final bool ignoreGesture;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initRate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures : true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) =>  Icon(
        Icons.star,
        color: color,
      ),
      onRatingUpdate: (rating) {
        onRatingUpdate!(rating);
      },

      itemSize: size.sp,
    );
  }
}
