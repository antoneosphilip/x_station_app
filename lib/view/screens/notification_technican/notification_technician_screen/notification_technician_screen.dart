import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/notification/notification_widget/notification_widget/notification_widget.dart';

import '../../../notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
import '../notification_technician_widget/notification_technician_widget/notification_technician_widget.dart';

class NotificationTechnicianScreen extends StatelessWidget {
  const NotificationTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: NotificationTechnicianWidget(),
    ));
  }
}
