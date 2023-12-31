import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/route_manager/page_name.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view/screens/electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import 'package:x_station_app/view/screens/everent/custom_ratting_bar/custom_rating_bar.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_cubit.dart';
import 'package:x_station_app/view_model/block/technical_cubit/technical_states.dart';
import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../view_model/block/add_faveorite_cubit/add_faveorite_cubit.dart';
import '../../../../../view_model/block/add_faveorite_cubit/add_faveorite_states.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';

class ElectricianDetailsItem extends StatelessWidget {
  final String name;
  final num rate;
  final String image;
  final String price;
  final  String email;
  final  String phone;
  final  String address;
  final  int id;


  const ElectricianDetailsItem({super.key, required this.name, required this.rate, required this.image, required this.price, required this.email, required this.phone, required this.address, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to( ElectricianInformationScreen(
          phone: phone,
          email: email,
          address: address,
          rate: rate,
          name: name,
          price: price,
          image: image,
        ),
          duration: const Duration(
          milliseconds: 250,
        ),
        );
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          width: 340.w,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorWhite,
          ),
          child: Padding(
            padding:  EdgeInsets.all(5.0.sp),
            child: Row(
              children: [
                Container(
                    width: 96.w,
                    height: 96.w,
                    decoration: BoxDecoration(
                      color: ColorManager.colorXGrey,
                      borderRadius: BorderRadius.circular(35.w),
                    ),
                    child: Container(
                      width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          image:  DecorationImage(image: NetworkImage(image!),fit: BoxFit.cover)
                        ),

                    )
                ),
                SizedBox(width: 16.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${name}",style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorLightBlack,fontWeight: FontWeight.w400),),
                    SizedBox(height: 10.h,),
                    Text("15 \$",style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorDarkBlue),),
                    SizedBox(height: 8.h,),
                    Row(
                      children: [
                         CustomRattingBar(size: 17,initRate: rate,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorPrimary,),
                        SizedBox(width: 5.w,),
                        Text("${rate}",style: TextStyleManager.textStyle14w500.copyWith(color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorLightBlack),),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
            BlocConsumer<TechnicalCubit,TechnicalStates>(
              listener: (context,state){
                if(state is AddFavoriteLoadingState){
                  EasyLoading.show(
                      status: 'Loading...',
                      maskType: EasyLoadingMaskType.black
                  );
                }
                if(state is AddFavoriteSuccessState){
                  EasyLoading.dismiss();
                  showFlutterToast(message: state.addFavoriteMode.message, state: ToastState.SUCCESS);
                  TechnicalCubit.get(context).getTechnicalList(id: id);
                  TechnicalCubit.get(context).getFavorite();


                }
                else if(state is AddFavoriteErrorState){
                  EasyLoading.dismiss();
                  showFlutterToast(message: state.err, state: ToastState.ERROR);
                }
              },
              builder: (context,state){
                return InkWell(
                  onTap: (){
                    TechnicalCubit.get(context).addFavorite(id: id);
                    print("objecttttttttt");
                    print(id);
                    print(TechnicalCubit.get(context).isFav[1]);
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: 57.14.h),
                    child: SvgPicture.asset(
                        TechnicalCubit.get(context).isFav[id]!?AssetsImage.heart
                        :AssetsImage.heart2
                        ,
                        color:ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorPrimary,width: 30),
                  ),
                );
              },
            ),

                SizedBox(width: 10.2.w,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
