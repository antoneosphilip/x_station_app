import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_widget/home_widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: HomeWidget(),
      ),
    );
  }
}
