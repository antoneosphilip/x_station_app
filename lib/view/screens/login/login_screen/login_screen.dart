import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view/screens/login/login_widget/login_widget/login_widget.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../view_model/block/login_cubit/login_cubit.dart';
import '../../../../view_model/repo/login_repo/login_repo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(sl.get<LoginRepoImpl>()),
      child: const Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: LoginWidget(),
        ),
      ),
    );
  }
}
