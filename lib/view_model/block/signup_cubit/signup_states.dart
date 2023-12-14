import 'package:x_station_app/model/login_model/login_model.dart';

import '../../../model/signup_model/signup_model.dart';

abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
SignUpModel signUpModel;
SignUpSuccessState(this.signUpModel);
}
class SignUpErrorState extends SignUpStates{
 final String err;

  SignUpErrorState(this.err);

}
class SelectAddressState extends SignUpStates{}

class SignTechnicalUpLoadingState extends SignUpStates{}
class SignUpTechnicalSuccessState extends SignUpStates{
 SignUpModel signUpModel;
 SignUpTechnicalSuccessState(this.signUpModel);
}
class SignUpTechnicalErrorState extends SignUpStates{
 final String err;

 SignUpTechnicalErrorState(this.err);

}

class ChangeVisibilityPasswordSignUp extends SignUpStates{}
class ChangeVisibilityRePasswordSignUp extends SignUpStates{}
