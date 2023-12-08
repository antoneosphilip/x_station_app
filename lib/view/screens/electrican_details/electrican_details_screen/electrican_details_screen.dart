import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/electrican_details/eletrician_details_widget/electrician_Details_widget/electrican_details_Widget.dart';

class ElectricianDetailsScreen extends StatelessWidget {
  const ElectricianDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ElectricianDetailsWidget(),
      ),
    );
  }
}
