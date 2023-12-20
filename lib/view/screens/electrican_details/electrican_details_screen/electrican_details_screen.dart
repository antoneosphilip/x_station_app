import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/electrican_details/eletrician_details_widget/electrician_Details_widget/electrican_details_Widget.dart';

class ElectricianDetailsScreen extends StatelessWidget {
  final int id;
  final String name;

  const ElectricianDetailsScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ElectricianDetailsWidget(id: id,name:name),
      ),
    );
  }
}
