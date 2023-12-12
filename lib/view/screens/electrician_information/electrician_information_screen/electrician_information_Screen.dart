import 'package:flutter/material.dart';

import '../electrician_information_widget/electrician_information_widget/electrician_information_widget.dart';

class ElectricianInformationScreen extends StatelessWidget {
  const ElectricianInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ElectricianInformationWidget(),
    ));
  }
}
