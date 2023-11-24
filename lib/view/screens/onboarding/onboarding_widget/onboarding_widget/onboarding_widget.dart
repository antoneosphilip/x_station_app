
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/model/onboarding_model/onboarding_model.dart';
import 'package:x_station_app/view/screens/onboarding/onboarding_widget/onboaridng_item/onboarding_item.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/route_manager/page_name.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController=PageController();
    List<OnBoardingModel> onBoardingList=[
      OnBoardingModel(AssetsImage.onBoardingImage, TextManager.serviceBecomeEasier, TextManager.takeYourTime),
      OnBoardingModel(AssetsImage.onBoardingImage, TextManager.reachingInTheUnKnown, TextManager.toYourDestination),
      OnBoardingModel(AssetsImage.onBoardingImage3, TextManager.prefectService,'')
    ];
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 800.h,
          child: PageView.builder(
           controller:pageController ,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
              itemBuilder: (context,index){
                return OnBoardingItem(
                    image: onBoardingList[index].image,
                    text1: onBoardingList[index].text1,
                    text2: onBoardingList[index].text2,
                  pageController: pageController,
                  isIndex: index,
                );

              }),
        )
      ],
    );
  }
}
