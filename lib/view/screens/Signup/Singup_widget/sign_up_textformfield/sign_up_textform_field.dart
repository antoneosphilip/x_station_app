import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view/screens/home_technical/home_technical_screen/home_technical_screen.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_states.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/regexp.dart';
import '../../../../../core/route_manager/page_name.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/login_cubit/login_states.dart';
import '../../../../core_widget/custom_top_snack/custom_top_snack.dart';
import '../../../../core_widget/snack_bar_custom/snack_bar_custom.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../core_widget/xstation_button_custom/x_station_button_custom.dart';
import '../../../open_map_search/open_map_search.dart';
import '../check_box_sin/checkbox_sign.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../technical_types/technical_types.dart';


class SignUpTextFormField extends StatefulWidget {
  final String value;

  SignUpTextFormField({super.key, required this.value});
  final List<String> items = [
    'cleaning',
    'fixes',
  ];
  String? technicalTypeSelected;
  final List<String> years=[];

  String? technicalExperienceYears;

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpCubit.get(context).formKey,
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          TextFormFieldCustom(
            keyboardType: TextInputType.name,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterName;
              }
              return null;
            },
            label: TextManager.fullName,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.user),
            controller: SignUpCubit.get(context).nameController,
          ),
          SizedBox(
            height: 19.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.emailAddress,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterEmail;
              }
              else if (!Regexp.isValidEmail(value)) {
                return TextManager.invalidEmail;
              }
              return null;
            },
            label: TextManager.validemail,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.email),
            controller: SignUpCubit.get(context).emailController,

          ),
          SizedBox(
            height: 19.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.name,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterAddress;
              }

              return null;
            },
            label: TextManager.address,
            suffix: true,
            suffixIcon: const Icon(Icons.location_on),
            suffixOnPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OpenMapSearchScreen(
                    callBackFunction:
                        (PickedData pickData) {
                      SignUpCubit.get(context)
                          .selectAddress(
                          pickData.addressName);
                      Get.back();
                    },
                  )));
            },
            controller: SignUpCubit.get(context).addressController,

          ),
          SizedBox(
            height: 19.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.phone,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterPhone;
              }
              return null;
            },
            label: TextManager.phonenumber,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.phonenumber),
            controller: SignUpCubit.get(context).phoneController,

          ),
          SizedBox(
            height: 19.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterPassword;
              }

              return null;
            },
            label: TextManager.password,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.lock),
            controller: SignUpCubit.get(context).passwordController,
          ),
          SizedBox(
            height: 19.h,
          ),
          TextFormFieldCustom(
            keyboardType: TextInputType.number,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return TextManager.pleaseEnterRePassword;
              }
              return null;
            },
            label: TextManager.rePassword,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.lock),
            controller: SignUpCubit.get(context).rePasswordController,

          ),
          widget.value==TextManager.technical?
          Padding(
            padding:  EdgeInsets.only(top: 19.h),
            child:  TechnicalTypes(
              items: [
                'cleaning',
                'fixes',
              ],
              years: [],
              technicalExperienceYears: "",
              technicalTypeSelected: "",
            ),
          ):const SizedBox(),
          SizedBox(
            height: 29.h,
          ),
          widget.value==TextManager.company?  TextFormFieldCustom(
            keyboardType: TextInputType.number,
            validate: (value) {},
            label: TextManager.companyId,
            suffix: true,
            suffixIcon: SvgPicture.asset(AssetsImage.user),
          ):const SizedBox(),

          const CheckBoxSignup(),
          SizedBox(
            height: 21.h,
          ),
          BlocConsumer<SignUpCubit,SignUpStates>(
            listener: (context,state){
              if(state is SignUpSuccessState) {
                Get.offAndToNamed(PageName.homeLayout);
                customSnackBar(
                    message: state.signUpModel.message.toString(),
                    snackBarType: SnackBarType.success,
                    context: context);
              }
              else if(state is SignUpErrorState){
                customSnackBar(
                    message: state.err,
                    snackBarType: SnackBarType.error,
                    context: context);
              }
            },
            builder: (context,state){
              return state is SignUpLoadingState?
              const CustomCircleLoading():
              XStationButtonCustom(
                textButton: TextManager.continuee,
                onPressed: (){
                  if(SignUpCubit.get(context).formKey.currentState!.validate()){
                    SignUpCubit.get(context).signUp(type: widget.value);
                  }
                }
                ,);
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TextManager.alreadymember,
                style: TextStyleManager.textStyle12w400
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 3.w,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(PageName.login);
                },
                child: Text(
                  TextManager.login,
                  style: TextStyleManager.textStyle12w400.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorManager.colorPrimary),
                ),
              ),
              SizedBox(height: 42.h,)
            ],
          ),
        ],
      ),
    );
  }
}
