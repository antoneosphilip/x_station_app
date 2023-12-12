import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/home_technical/home_technical_widget/home_technical_widget/home_technical_widget.dart';


class HomeTechnicalScreen extends StatelessWidget {
  const HomeTechnicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: HomeTechnicalWidget(),
      ),
    );
  }
}
