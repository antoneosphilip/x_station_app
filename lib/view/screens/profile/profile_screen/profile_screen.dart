import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';
import '../../../../core/route_manager/page_name.dart';
import '../../../../core/text_manager/text_manager.dart';
import '../../../../utility/database/local/cache_helper.dart';
import '../../../core_widget/tab_bar_widget/tab_bar_widget.dart';
import '../../profile_settings_screen/profile_settings_screen/profile_settings_screen.dart';
import '../profile_widget/contact_us_card.dart';
import '../profile_widget/first_row.dart';
import '../profile_widget/item_card.dart';
import '../profile_widget/log_out_dialog.dart';
import '../profile_widget/user_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Column(
              children:
              [
                Stack(
                  children: [
                    const AppBarWidget(text: TextManager.userProfile,height: 199,),
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
                Padding(
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
                BuildItemCard(
                  isProfile: true,
                    text:"profile",
                    onTap: () {
                    Get.to(ProfileSettingsScreen());
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

                // BuildItemCard(
                //     text: "language".tr,
                //     onTap: () {
                //       Get.bottomSheet(
                //         Container(
                //           height: 400.h,
                //           color: Colors.white,
                //           child: Column(
                //             children: [
                //               ListTile(
                //                 title: const Text("English"),
                //                 onTap: () {
                //                   var locale = const Locale('en');
                //
                //                   Get.updateLocale(locale);
                //                   Get.back();
                //                 },
                //               ),
                //               ListTile(
                //                 title: const Text("Arabic"),
                //                 onTap: () {
                //                   var locale = const Locale('ar');
                //
                //                   Get.updateLocale(locale);
                //                   Get.back();
                //                 },
                //               ),
                //               ListTile(
                //                 title: const Text("French"),
                //                 onTap: () {
                //                   var locale = const Locale('fr');
                //
                //                   Get.updateLocale(locale);
                //                   Get.back();
                //                 },
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //     image: AssetsImage.lOGO),
              ],
            ),
            // BuildItemCard(
            //     text: TextManager.TERMS_AND_CONDITIONS,
            //     onTap: () {
            //       Get.toNamed(PageName.TERMS_CONDITIONS);
            //     },
            //     image: AssetsManager.TERMS_CONDITIONS),
            // BuildItemCard(
            //     text: TextManager.FAQS,
            //     onTap: () {
            //       Get.toNamed(PageName.FAQ);
            //     },
            //     image: AssetsManager.FAQ),
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
        ),
      ),
    );
  }
}
