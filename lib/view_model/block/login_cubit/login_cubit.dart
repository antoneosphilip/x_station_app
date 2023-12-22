import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/model/login_model/login_model.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(this.loginRepo):super(LoginInitialState());
  LoginRepo loginRepo;
  LoginModel? loginModel;
  static LoginCubit get(context)=>BlocProvider.of<LoginCubit>(context);
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool visibility = true;


  void changeVisibilityPassword() {
    visibility = !visibility;
    emit(ChangeVisibilityPassword());
  }

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

        emit(LoginSuccessState(r));
        CacheHelper.put(key: 'token', value: r.data!.token);
        CachingDataManager.instance.cachLoginInfo(r);
            loginModel=r;
      },
    );
  }

}