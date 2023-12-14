import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_states.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_states.dart';
import 'package:x_station_app/view_model/repo/login_repo/login_repo.dart';
import 'package:x_station_app/view_model/repo/signup_repo/sigup_repo.dart';

import '../../../utility/database/local/cach_data.dart';
import '../../../utility/database/local/cache_helper.dart';

class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit(this.signUpRepo):super(SignUpInitialState());
  SignUpRepo signUpRepo;
  static SignUpCubit get(context)=>BlocProvider.of<SignUpCubit>(context);
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var rePasswordController=TextEditingController();
  var addressController=TextEditingController();
  var nationalId=TextEditingController();


  var formKey = GlobalKey<FormState>();
  String? type;
  String? technicalTypeSelected;
  String? technicalExperienceYears;


  bool visibility = true;
  bool visibilityRePassword = true;

  void changeVisibilityPassword() {
    visibility = !visibility;
    emit(ChangeVisibilityPasswordSignUp());
  }
  void changeVisibilityRePassword() {
    visibilityRePassword = !visibilityRePassword;
    emit(ChangeVisibilityRePasswordSignUp());
  }


  void selectAddress(String address) {
    addressController.text = address;
    emit(SelectAddressState());
  }


  Future<void> signUp({required type})async{
    emit(SignUpLoadingState());
    var data=await signUpRepo.signUp(
       nameController.text,
      emailController.text,
      phoneController.text,
      passwordController.text,
       rePasswordController.text,
       addressController.text,
       type!,
    );
    data.fold(
          (l) {
            print(l);
        emit(
            SignUpErrorState(l.message));
      },
          (r) {
            emit(SignUpSuccessState(r));
            CacheHelper.put(key: 'token', value: r.data!.token);
          },
    );
  }


  Future<void> signUpTechnical({required type})async{
    emit(SignTechnicalUpLoadingState());
    var data=await signUpRepo.signUpTechnical(
      nameController.text,
      emailController.text,
      phoneController.text,
      passwordController.text,
      rePasswordController.text,
      addressController.text,
      type!,
      technicalTypeSelected!,
      nationalId.text,
      technicalExperienceYears!,
    );
    data.fold(
          (l) {
        print(l);
        emit(
            SignUpTechnicalErrorState(l.message));
      },
          (r) {
        emit(SignUpTechnicalSuccessState(r));
        CacheHelper.put(key: 'token', value: r.data!.token);
      },
    );
  }

}