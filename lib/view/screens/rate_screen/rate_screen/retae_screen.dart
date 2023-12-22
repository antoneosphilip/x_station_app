import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/rate_screen/rate_widget/rate_widget.dart';

class RateScreen extends StatelessWidget {
  final int userID;
  const RateScreen({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: RateWidget(userID: userID,),
      ),
    );
  }
}
