import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/assets_manager/assets_manager.dart';
import '../../../../core/color_manager/color_manager.dart';

import 'item_card.dart';

class ContactUsCard extends StatefulWidget {
  const ContactUsCard({super.key});

  @override
  State<ContactUsCard> createState() => _ContactUsCardState();
}

class _ContactUsCardState extends State<ContactUsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                color: ColorManager.colorWhite,
                boxShadow:  const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2), // #000000 with 20% opacity
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.sp),
                child: ExpansionTile(
                  expandedAlignment: Alignment.centerLeft,
                  iconColor: ColorManager.colorPrimary,
                  collapsedIconColor: ColorManager.colorGrey,
                  collapsedBackgroundColor: ColorManager.colorWhite,
                  title: Row(
                    children: [
                      SvgPicture.asset(AssetsImage.contuctUs),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        "contuct us".tr,

                      ),
                    ],
                  ),
                  children: [
                    BuildItemCard(
                        text:"chat with us".tr,
                        onTap: () {
                          // move to chat Screen
                        },
                        image: AssetsImage.chat2),
                    BuildItemCard(
                        text: "phone call".tr,
                        onTap: () async {
                          // final Uri emailLaunchUri = Uri(
                          //   scheme: "tel",s
                          //   path: '01292670069',
                          // );
                          // launchUrl(emailLaunchUri);
                        },
                        image: AssetsImage.phone),
                    BuildItemCard(
                        text: "web site".tr,
                        onTap: () async {
                          // var url = ProfileCubit.get(context)
                          //     .contactUsModel!
                          //     .facebook!;
                          // if (await canLaunch(url)) {
                          //   await launch(url);
                          // } else {
                          //   throw 'Could not launch $url';
                          // }
                        },
                        image: AssetsImage.webSite),
                    // BuildItemCard(
                    //     text: "email".tr,
                    //     onTap: () async {
                    //
                    //     },
                    //     image: "email"),
                  ],
                  onExpansionChanged: (isExpanded) {
                    print('Expanded $isExpanded');
                  },
                ),
              ),
            ),
          ),

        ]
    );
  }
}
