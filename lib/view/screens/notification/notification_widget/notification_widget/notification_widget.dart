import 'package:flutter/cupertino.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';


import '../notification_body/notifiaction_list.dart';
import '../notification_top/notification_top.dart';
import '../notification_top/notification_top_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         AppBarWidget(
           text: TextManager.notification,
           isArrow: false,
         ),
        MessageText(),
        NotificationList(),
      ],
    );
  }
}
