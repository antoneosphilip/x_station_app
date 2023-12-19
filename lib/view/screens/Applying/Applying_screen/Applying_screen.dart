import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/Applying/Applying_widget/Applying_Widget/Applying_widget.dart';

class ApplyScreen extends StatelessWidget {
  final String title;
  final String description;
  final int id;


  const ApplyScreen({super.key, required this.title, required this.description, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ApplayWidget(title: title,description: description, id: id,),
    ));
  }
}
