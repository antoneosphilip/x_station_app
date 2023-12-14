import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/view/screens/everent/user_item.dart';
import 'package:x_station_app/view/screens/everent/user_list.dart';

import 'custom_ratting_bar/custom_rating_bar.dart';
class everent extends StatelessWidget {
  const everent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2A),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 56,),
               const Row(
                children: [
                  Icon(Icons.account_circle,color: Colors.grey,size: 32,),
                  SizedBox(width: 73,),
                  Expanded(child: Text("EVERENT",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: Colors.white),)),
                  Icon(Icons.search,color: Colors.grey,size: 32,),
                ],
              ),
              SizedBox(height: 24.h,),
              const Text(" User reviews",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: Colors.white),),
              const SizedBox(height: 20,),
              const Text(" check out our users reviews on our events",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:  Color(0xffFFC600)),),
              SizedBox(height: 40.h,),
              Column(
                children: [
                  const UserList(),
                  SizedBox(height: 40.h,),
                  SizedBox(
                    height: 12,
                    child: Padding(
                      padding:  const EdgeInsets.only(left: 145,),
                      child: ListView.separated(
                           scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index){
                      return  Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.colorWhite,
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                             return const SizedBox(width: 16,);
                      }, itemCount: 3,
                      ),
                    ),
                  )
                ]
              ),

            ],
          ),
        ),
      )


    );
  }
}
