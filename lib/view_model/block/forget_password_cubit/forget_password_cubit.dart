
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view_model/repo/forget_password_repo/forget_password_repo.dart';

import 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() :super(ForgetPasswordInitialState());
  // ForgetPasswordRepo forgetPasswordRepo;
  static ForgetPasswordCubit get(context) => BlocProvider.of<ForgetPasswordCubit>(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var passwordConfirmationController=TextEditingController();

  ////////////////////Forget Password////////////////////
//   Future<void> forgetPassword() async {
//     emit(ForgetPasswordLoadingState());
//     var data= await forgetPasswordRepo.forgetPassword(email: emailController.text);
//     data.fold((l) {
//       emit(ForgetPasswordErrorState(l.toString()));
//     },
//
//             (r)  {
//       emit(ForgetPasswordSuccessState());
//             }
//     );
// }
// ///////////////////////Check Code//////////////////////
//   Future<void> checkCode({required code}) async {
//     var data= await forgetPasswordRepo.checkCode(email: emailController.text, code: code);
//     data.fold((l) {
//       emit(CheckCodeErrorState(l.toString()));
//     },
//             (r)  {
//           emit(CheckCodeSuccessState());
//         }
//     );
//   }
//
//
//   ///////////////////////Reset Password//////////////////////
//   Future<void> resetPassword() async {
//     emit(ResetPasswordLoadingState());
//     var data= await forgetPasswordRepo.resetPassword(email: emailController.text, password:passwordController.text,
//         confirmPassword: passwordConfirmationController.text );
//     data.fold((l) {
//       emit(ResetPasswordErrorState(l.toString()));
//     },
//             (r)  {
//           emit(ResetPasswordSuccessState());
//         }
//     );
//   }

}