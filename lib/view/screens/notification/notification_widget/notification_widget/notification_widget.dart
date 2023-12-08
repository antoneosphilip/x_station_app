import 'package:flutter/cupertino.dart';


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
          NotificationAppBar(),
        MessageText(),
        NotificationList(),
      ],
    );
  }
}
