import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../utility/database/local/cach_data.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(this.loginRepo):super(LoginInitialState());
  LoginRepo loginRepo;
  static LoginCubit get(context)=>BlocProvider.of<LoginCubit>(context);
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> login()async{
    emit(LoginLoadingState());
    var data=await loginRepo.login(emailController.text, passwordController.text);
    data.fold(
          (l) {
            print(l);
        emit(
            LoginErrorState(l.message));
      },
          (r) {
        CachingDataManager.instance.cachLoginInfo(r);
        emit(LoginSuccessState(r));
      },
    );
  }

}