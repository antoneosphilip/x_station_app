import 'package:flutter/material.dart';
import 'package:x_station_app/view/screens/Posting/Posting_widgett/Posting_widget/Posting_widget.dart';

class Posting extends StatelessWidget {
  const Posting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: PostingWidget(),
    ));
  }
}
