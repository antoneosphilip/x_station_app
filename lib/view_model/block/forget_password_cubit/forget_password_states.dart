import 'package:x_station_app/model/forget_password_model/forget_password_model.dart';

abstract class ForgetPasswordStates{}
class ForgetPasswordInitialState extends ForgetPasswordStates{}
//////////////////Forget Password////////////////
class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordSuccessState extends ForgetPasswordStates{
ForgetPasswordModel forgetPasswordModel;
ForgetPasswordSuccessState(this.forgetPasswordModel);
}
class ForgetPasswordErrorState extends ForgetPasswordStates{
  final String err;

  ForgetPasswordErrorState(this.err);

}

/////////////////////Check Code//////////////////////
class CheckCodeLoadingState extends ForgetPasswordStates{}
class CheckCodeSuccessState extends ForgetPasswordStates{
  ForgetPasswordModel forgetPasswordModel;
  CheckCodeSuccessState(this.forgetPasswordModel);
}
class CheckCodeErrorState extends ForgetPasswordStates{
  final String err;

  CheckCodeErrorState(this.err);

}



/////////////////////Reset Password//////////////////////
class ResetPasswordLoadingState extends ForgetPasswordStates{}
class ResetPasswordSuccessState extends ForgetPasswordStates{
ForgetPasswordModel forgetPasswordModel;
ResetPasswordSuccessState(this.forgetPasswordModel);
}
class ResetPasswordErrorState extends ForgetPasswordStates{
  final String err;

  ResetPasswordErrorState(this.err);

}