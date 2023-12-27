import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';


import '../../../../notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import '../../../notification/notification_widget/notification_top/notification_top_text.dart';
import '../notification_technician_body/notifiaction_technician_list.dart';


class NotificationTechnicianWidget extends StatelessWidget {
  const NotificationTechnicianWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         AppBarWidget(
           text: TextManager.notification,
           isArrow: false,
         ),
        MessageText(),
        NotificationTechnicianList(),
      ],
    );
  }
}
