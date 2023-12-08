
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';

import 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(this.forgetPasswordRepo) :super(ForgetPasswordInitialState());
  ForgetPasswordRepo forgetPasswordRepo;
  static ForgetPasswordCubit get(context) => BlocProvider.of<ForgetPasswordCubit>(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyResetPass = GlobalKey<FormState>();

  var pinController=TextEditingController();

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var passwordConfirmationController=TextEditingController();

  //////////////////Forget Password////////////////////
  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var data= await forgetPasswordRepo.forgetPassword(email: emailController.text);
    data.fold((l) {
      emit(ForgetPasswordErrorState(l.message));
    },

            (r)  {
      emit(ForgetPasswordSuccessState(r));
            }
    );
}
///////////////////////Check Code//////////////////////
  Future<void> checkCode() async {
    emit(CheckCodeLoadingState());
    var data= await forgetPasswordRepo.checkCode(email: emailController.text, code: pinController.text);
    data.fold((l) {
      emit(CheckCodeErrorState(l.message));
    },
            (r)  {
          emit(CheckCodeSuccessState(r));
        }
    );
  }


  ///////////////////////Reset Password//////////////////////
  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    var data= await forgetPasswordRepo.resetPassword(email: emailController.text, password:passwordController.text,
        confirmPassword: passwordConfirmationController.text );
    data.fold((l) {
      emit(ResetPasswordErrorState(l.message));
    },
            (r)  {
          emit(ResetPasswordSuccessState(r));
        }
    );
  }

}