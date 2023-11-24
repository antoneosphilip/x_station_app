
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/verification/verification_widget/verification_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
        child: VerificationWidget(),
      ),
    );
  }
}