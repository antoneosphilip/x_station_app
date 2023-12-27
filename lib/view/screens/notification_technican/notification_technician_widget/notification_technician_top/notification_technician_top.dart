import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';

class NotificationTechnicianAppBar extends StatelessWidget {
  const NotificationTechnicianAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 134,
      decoration: const BoxDecoration(
          color: ColorManager.colorPrimary,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      child: Text(
        TextManager.notification.tr,
        style: TextStyleManager.textStyle36w700.copyWith(color: Colors.white),
      ),
    );
  }
}
