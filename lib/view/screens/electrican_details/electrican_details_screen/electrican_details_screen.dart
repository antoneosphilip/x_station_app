import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/electrican_details/eletrician_details_widget/electrician_Details_widget/electrican_details_Widget.dart';

class ElectricianDetailsScreen extends StatelessWidget {
  final int id;
  const ElectricianDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ElectricianDetailsWidget(id: id),
      ),
    );
  }
}
