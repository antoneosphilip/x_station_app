import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_states.dart';
import 'package:x_station_app/view_model/block/signup_cubit/signup_cubit.dart';

import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../../../../core_widget/text_form_field/text_form_field_custom.dart';

class TechnicalTypes extends StatefulWidget {



  @override
  State<TechnicalTypes> createState() => _TechnicalTypesState();

}

class _TechnicalTypesState extends State<TechnicalTypes> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<=10;i++){
      SignUpCubit.get(context).years.add(i.toString()+' years');
      CategoryCubit.get(context).getCategorySelectMenu();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CategoryCubit,CategoryStates>(
      listener: (context,state){},
      builder: (context,state){
        return state is CategorySelectMenuLoadingState?const CustomCircleLoading():
        Column(
          children: [
            TextFormFieldCustom(
              keyboardType: TextInputType.text,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return TextManager.nationalId.tr;
                }
                return null;
              },
              label: TextManager.nationalId.tr,
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.user),
              controller: SignUpCubit.get(context).nationalId,

            ),
            SizedBox(height: 19.h,),
            (CategoryCubit.get(context).categorySelectMenuModel!=null)?
            Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                    color: ColorManager.colorGrey.withOpacity(.20),
                    border: Border.all(color: ColorManager.colorGrey.withOpacity(.20)),
                    borderRadius: BorderRadius.circular(10.r)
                ),
                child:
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    iconStyleData: IconStyleData(iconEnabledColor: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorGrey),
                    dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          color:  ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhiteDarkMode,
                        )
                    ),
                    isExpanded: true,
                    hint:  Text(
                        TextManager.technicalType.tr,
                        style: TextStyleManager.textStyle14w300.copyWith(
                            color:
                            ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

                        )
                    ),
                    items: CategoryCubit.get(context).categorySelectMenuModel?.data!
                        .map<DropdownMenuItem<String>>(
                          (dynamic item) => DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {
                            SignUpCubit.get(context).technicalTypeSelectedId=item.id;
                          });
                        },
                        value: item.name.toString(),// Assuming 'name' is a string property in your Data class
                        child: Text(
                          item.name.toString(), // Assuming 'name' is a string property in your Data class
                          style: TextStyleManager.textStyle14w300.copyWith(color:
                          ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary
                          ),
                        ),
                      ),
                    )
                        .toList(),
                    value: SignUpCubit.get(context).technicalTypeSelected,
                    onChanged: (String? value) {
                      setState(() {
                        SignUpCubit.get(context).technicalTypeSelected=value!;
                        print(value);
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      height: 40,
                      width: 140,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,

                    ),
                  ),
                )
            ):
            state is CategorySelectMenuErrorState?
            Center(child: Text(state.err)):
            const SizedBox(),
            SizedBox(height: 19.h,),
            Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                  color: ColorManager.colorGrey.withOpacity(.20),
                  border: Border.all(color: ColorManager.colorGrey.withOpacity(.20)),
                  borderRadius: BorderRadius.circular(10.r)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  iconStyleData: IconStyleData(iconEnabledColor: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorGrey),
                  dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        color:  ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhiteDarkMode,
                      )
                  ),
                  isExpanded: true,
                  hint:  Text(
                      TextManager.experienceYears.tr,
                      style: TextStyleManager.textStyle14w300.copyWith(
                          color:
                          ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

                      )
                  ),
                  items: SignUpCubit.get(context).years
                      .map(
                          (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style: TextStyleManager
                                .textStyle14w300.copyWith(
                                color:
                                ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorSecondary

                            )
                        ),
                      ))
                      .toList(),
                  value:  SignUpCubit.get(context).technicalExperienceYears,
                  onChanged: (String? value) {
                    setState(() {
                      SignUpCubit.get(context).technicalExperienceYears=value;
                      // SignUpCubit.get(context).technicalExperienceYears=value;

                    });
                    print(SignUpCubit.get(context).technicalExperienceYears);
                  },

                  buttonStyleData:  const ButtonStyleData(
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData:  const MenuItemStyleData(
                    height: 40,


                  ),
                ),
              ),
            ),

          ],
        );
      },
    );
  }
}
