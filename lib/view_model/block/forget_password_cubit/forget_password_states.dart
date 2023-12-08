abstract class ForgetPasswordStates{}
class ForgetPasswordInitialState extends ForgetPasswordStates{}
//////////////////Forget Password////////////////
class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordSuccessState extends ForgetPasswordStates{

}
class ForgetPasswordErrorState extends ForgetPasswordStates{
  final String err;

  ForgetPasswordErrorState(this.err);

}

/////////////////////Check Code//////////////////////
class CheckCodeLoadingState extends ForgetPasswordStates{}
class CheckCodeSuccessState extends ForgetPasswordStates{

}
class CheckCodeErrorState extends ForgetPasswordStates{
  final String err;

  CheckCodeErrorState(this.err);

}



/////////////////////Reset Password//////////////////////
class ResetPasswordLoadingState extends ForgetPasswordStates{}
class ResetPasswordSuccessState extends ForgetPasswordStates{

}
class ResetPasswordErrorState extends ForgetPasswordStates{
  final String err;

  ResetPasswordErrorState(this.err);

}