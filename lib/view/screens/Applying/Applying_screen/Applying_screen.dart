import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/Applying/Applying_widget/Applying_Widget/Applying_widget.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ApplayWidget(),
    ));
  }
}
