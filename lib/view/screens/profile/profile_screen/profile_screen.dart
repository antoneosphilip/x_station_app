import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/view_model/block/login_cubit/login_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_cubit.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/route_manager/page_name.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../../utility/database/local/cache_helper.dart';
import '../../../core_widget/custom_circle_loading/custom_circle_loading.dart';
import '../../../core_widget/custom_top_snack/custom_top_snack.dart';
import '../../../core_widget/snack_bar_custom/snack_bar_custom.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';
import '../../profile_settings_screen/profile_settings_screen/profile_settings_screen.dart';
import '../profile_widget/contact_us_card.dart';
import '../profile_widget/first_row.dart';
import '../profile_widget/item_card.dart';
import '../profile_widget/log_out_dialog.dart';
import '../profile_widget/profile_shimmer.dart';
import '../profile_widget/user_data_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics:  const BouncingScrollPhysics(),
        child: BlocConsumer<ProfileCubit,ProfileStates>(
          listener: (context,state){
            if(state is LogOutSuccessState){
              CacheHelper.removeData(key: 'token');
              Get.offAllNamed(PageName.login);
              customSnackBar(
                  message: state.logOutModel.message.toString(),
                  snackBarType: SnackBarType.success,
                  context: context);
              LoginCubit.get(context).loginModel=null;

            }
            if(state is LogOutErrorState){
              customSnackBar(
                  message: state.err.toString(),
                  snackBarType: SnackBarType.error,
                  context: context);
            }
          },
          builder: (context,state){
            return state is ProfileLoadingState?const ProfileShimmer():(ProfileCubit.get(context).profileModel!=null)?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Column(
                  children:
                  [
                    Stack(
                      children: [
                        const AppBarWidget(text: TextManager.userProfile,isArrow: false,),
                        Center(
                          child: Padding(
                            padding:  EdgeInsets.only(top: 130.h),
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.SzixlF6Io24jCN67HHZulAHaLH?rs=1&pid=ImgDetMain'),
                              radius: 70,
                            ),
                          ),
                        ),

                      ],
                    ),
                    const UserData(),
                    SizedBox(height: 32.h,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(PageName.favoriteList);
                      },
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 80.w),
                        child: Container(
                          height: 64.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: ColorManager.colorLightColorPrimary
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 16.w,),
                              Expanded(child: Text(TextManager.faveoriteList.tr,style: TextStyleManager.textStyle14w500.copyWith(fontSize: 18.sp),)),
                              SizedBox(width: 34.w,),
                              Expanded(child: SvgPicture.asset(AssetsImage.faveoriteList)),
                              SizedBox(width: 16.w,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h,),
                    BuildItemCard(
                        isProfile: true,
                        text:"profile".tr,
                        onTap: () {
                          Get.to(ProfileSettingsScreen());
                        },
                        image: AssetsImage.profile2),
                    BuildItemCard(
                        text:"Terms and conditns".tr,
                        onTap: () {
                        },
                        image: AssetsImage.terms),
                    BuildItemCard(
                        text:"FAQ'S".tr,
                        onTap: () {
                        },
                        image: AssetsImage.faqs),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const ContactUsCard(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Container(
                    width: 358.w,
                    height: ScreenUtil().setHeight(48),
                    decoration: BoxDecoration(
                      color: ColorManager.colorWhite,
                      borderRadius: BorderRadius.circular(8.sp),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2), // #000000 with 20% opacity
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint:  Text(
                          'Select Item'.tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorManager.colorBlack,
                          ),
                        ),
                        items: ProfileCubit.get(context)
                            .list
                            .map(
                                (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                  style: TextStyleManager
                                      .textStyle16w500,
                              ),
                            ))
                            .toList(),
                        value: ProfileCubit.get(context).selectedItem,
                        onChanged: (String? value) {
                          ProfileCubit.get(context).changeLanguage(value);
                          setState(() {
                            String x=value!;
                          ProfileCubit.get(context).selectedItem=value!;
                          print(ProfileCubit.get(context).selectedItem);
                        });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 48,
                          width: 140,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                BuildItemCard(
                    text: "log out".tr,
                    onTap: () {
                      ProfileCubit.get(context).logOut();

                    },
                    image: AssetsImage.logOut),
              ],
            ):state is ProfileErrorState?
                Text(state.err):
                const SizedBox();
          },
        ),
      ),
    );
  }
}
