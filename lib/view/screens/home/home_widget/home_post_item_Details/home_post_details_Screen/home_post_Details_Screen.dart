import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/home/home_widget/home_post_item_Details/home_post_details_widget/home_post_Details_widget.dart';

class HomePostDetailsScreen extends StatelessWidget {
  final int id;
  const HomePostDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: HomePostDetailsWidget(id: id,),
      ),
    );
  }
}
