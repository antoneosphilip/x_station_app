import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/color_shimmer/color_shimmer.dart';
import '../../../../core/style_font_manager/style_manager.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'contact_us_card.dart';
import 'item_card.dart';



class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
          baseColor:ColorShimmer.baseColor,
          highlightColor: ColorShimmer.highlightColor,
          child:   Column(
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
                  SizedBox(height: 32.h,),
                  InkWell(
                    onTap: (){
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
                            Expanded(child: Text(TextManager.faveoriteList,style: TextStyleManager.textStyle14w500.copyWith(fontSize: 18.sp),)),
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
                      text:"profile",
                      onTap: () {
                      },
                      image: AssetsImage.profile2),
                  BuildItemCard(
                      text:"Terms and conditns",
                      onTap: () {
                      },
                      image: AssetsImage.terms),
                  BuildItemCard(
                      text:"FAQ'S",
                      onTap: () {
                      },
                      image: AssetsImage.faqs),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const ContactUsCard(),
              ),
              BuildItemCard(
                  text: "log out",
                  onTap: () {

                  },
                  image: AssetsImage.logOut),
            ],
          )
        )
    );
  }
}
