import 'package:x_station_app/model/login_model/login_model.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
LoginModel loginModel;
LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates{
 final String err;

  LoginErrorState(this.err);

}