
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/view_model/block/home_layout_cubit/home_layout_states.dart';
import 'package:x_station_app/view_model/block/profile_cubit/profile_states.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../core/text_manager/text_manager.dart';
import '../../../utility/database/local/cach_data.dart';
import '../../../view_model/block/home_layout_cubit/home_layoout_cubit.dart';
import '../../../view_model/block/profile_cubit/profile_cubit.dart';



class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeLayoutCubit layoutCubit = HomeLayoutCubit.get(context);
        return BlocConsumer<ProfileCubit,ProfileStates>(
          listener: (context,state){},
          builder: (context,state){
            return  Scaffold(
              body: layoutCubit.pageList()[HomeLayoutCubit.get(context).currentIndex],
              bottomNavigationBar:
              CachingDataManager.instance.getLoginModel().data?.type=='customer'?
              CurvedNavigationBar(
                index: 0,
                backgroundColor:  ProfileCubit.get(context).isDark?ColorManager.colorDark:ColorManager.colorWhite,
                buttonBackgroundColor:  ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorPrimary,
                height: 65.h,
                color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorPrimary,
                animationDuration: const Duration(milliseconds: 300),
                items:
                [
                  SvgPicture.asset(AssetsImage.home,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.category,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.chat,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.profile,color: ColorManager.colorWhite,),
                ],
                animationCurve: Curves.easeInOut,
                onTap: (index) {
                  HomeLayoutCubit.get(context).bottomTap(index);
                },

              ):
              CurvedNavigationBar(
                index: 0,
                backgroundColor:  ProfileCubit.get(context).isDark?ColorManager.colorDark:ColorManager.colorWhite,
                buttonBackgroundColor:  ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorPrimary,
                height: 65.h,
                color: ProfileCubit.get(context).isDark?ColorManager.colorLightDark:ColorManager.colorPrimary,
                animationDuration: const Duration(milliseconds: 300),
                items:
                [
                  SvgPicture.asset(AssetsImage.home,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.orderList,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.chat,color: ColorManager.colorWhite,),
                  SvgPicture.asset(AssetsImage.profile,color: ColorManager.colorWhite,),
                ],
                animationCurve: Curves.easeInOut,
                onTap: (index) {
                  HomeLayoutCubit.get(context).bottomTap(index);
                },

              )
              ,
            );
          },
        );
      },
    );
  }
}