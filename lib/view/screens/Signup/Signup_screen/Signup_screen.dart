import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view/screens/Signup/Singup_widget/signup_widget/signup_widget.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';

import '../../../../core/service_locator/service_locator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SignupWidget(),
      ),
    );
  }
}
