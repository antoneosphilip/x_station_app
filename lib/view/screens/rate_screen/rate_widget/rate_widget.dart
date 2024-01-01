
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/core_widget/elevated_button/elevated_button_custom.dart';
import 'package:x_station_app/view/core_widget/flutter_toast/flutter_toast.dart';
import 'package:x_station_app/view/core_widget/text_form_field/text_form_field_custom.dart';
import 'package:x_station_app/view/screens/everent/custom_ratting_bar/custom_rating_bar.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';

import '../../../../view_model/block/profile_cubit/profile_cubit.dart';

class RateWidget extends StatelessWidget {
  final int userID;

  const   RateWidget({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    double rate=1;
    return  Padding(
      padding:  EdgeInsets.only(left: 19.w,right: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 28.h,),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor:ColorManager.colorPrimary,
            child: SvgPicture.asset(AssetsImage.arrowLeft),
          ),
          SizedBox(height: 37.h,),
          Text(TextManager.rating,style: TextStyleManager.textStyle36w700.copyWith(color: ProfileCubit.get(context).isDark?
          ColorManager.colorWhiteDarkMode:
          ColorManager.colorSecondary,),),
          SvgPicture.asset(AssetsImage.line,width: 100.w,color: ProfileCubit.get(context).isDark?
          ColorManager.colorWhiteDarkMode:
          ColorManager.colorPrimary,),
          SizedBox(height: 80.h,),
          Center(
        child: RatingBar.builder(
          initialRating: 1.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          ignoreGestures : false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context,index) {
            if(index<2){
              return const Icon(
                Icons.star,
                color: ColorManager.colorRed,
              );
            }
            else{
              return const Icon(
                Icons.star,
                color: ColorManager.colorGold,
              );
            }
          },

          onRatingUpdate: (rating) {
            print(rating);
            rate=rating;
          },

          itemSize: 40.sp,
        ),
      ),
          SizedBox(height: 50.h,),
          TextFormFieldCustom(
            validate: (value){},
            maxLines: 10,
            hint: "Review",
            controller: PostsCubit.get(context).reviewController,
          ),
          SizedBox(height: 50.h,),

          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButtonCustom(
                    onPressed: (){
                      Get.back();
                    },
                    width: 148.w,
                    height: 70.h,
                    radius: 60,
                    colors: Colors.white,
                    borderColor: ColorManager.colorPrimary,
                    widget: Text("cancel",style: TextStyleManager.textStyle24w500.copyWith(color: ColorManager.colorPrimary),),
                  ),
                ),
                SizedBox(width: 21.w,),
                Expanded(
                  child: BlocConsumer<PostsCubit,PostsStates>(
                    listener: (context,state){
                      if(state is UserRateLoadingState){
                        EasyLoading.show(
                          status: 'Loading...',
                          maskType: EasyLoadingMaskType.black
                        );
                      }
                      else if(state is UserRateSuccessState){
                        EasyLoading.dismiss();
                        showFlutterToast(message: state.acceptPostModel.message,
                            state: ToastState.SUCCESS);
                        PostsCubit.get(context).reviewController.text='';
                      }
                      else if(state is UserRateErrorState){
                        EasyLoading.dismiss();
                        showFlutterToast(message: state.err,
                            state: ToastState.SUCCESS);
                      }
                    },
                    builder: (context,state){
                      return  ElevatedButtonCustom(
                        width: 148.w,
                        height: 70.h,
                        radius: 60,
                        colors: Colors.white,
                        onPressed: (){
                          PostsCubit.get(context).userRate(userId: userID, rate: rate);
                        },
                        borderColor: ColorManager.colorPrimary,
                        widget: Text("Done",style: TextStyleManager.textStyle24w500.copyWith(color: ColorManager.colorPrimary),),
                      );
                    },
                  ),
                ),


              ],
            ),
          )


        ],
      ),
    );
  }
}
