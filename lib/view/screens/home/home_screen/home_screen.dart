import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';

import '../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../home_widget/home_widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return PostsCubit.get(context).getPosts();
      },
      child: const Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: HomeWidget(),
        ),
      ),
    );
  }
}
