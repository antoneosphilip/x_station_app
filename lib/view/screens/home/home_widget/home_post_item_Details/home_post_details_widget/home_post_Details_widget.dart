
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/style_font_manager/style_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_cubit.dart';
import 'package:x_station_app/view_model/block/posts_cubit/posts_states.dart';

import '../home_post_details_Screen/home_post_Details_Screen.dart';
import 'list_user_applied.dart';


class HomePostDetailsWidget extends StatelessWidget {
  final int id;

  const HomePostDetailsWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    PostsCubit.get(context).showPost(id: id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h,),
        InkWell(
          onTap: (){
          },
          child: Container(
            width: 390.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.circular(16.r),
              color: ColorManager.colorWhite,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: BlocConsumer<PostsCubit,PostsStates>(
                listener: (context,state){},
                builder: (context,state){
                  return state is ShowPostsLoadingState?
                  const PostingShimmer(isText:false):
                  (PostsCubit.get(context).showPostModel!=null)?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 16.w,),
                          Row(
                            children: [
                              SvgPicture.asset(AssetsImage.arrowLeft),
                              const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.Z5BlhFYs_ga1fZnBWkcKjQHaHz?rs=1&pid=ImgDetMain")
                              ),
                            ],
                          ),
                          SizedBox(width: 7.w,),
                          Text("${PostsCubit.get(context).showPostModel!.data!.user!.name!}",style: TextStyleManager.textStyle14w500),
                        ],
                      ),
                      SizedBox(height: 16.h,),
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,),
                        child: Text('${PostsCubit.get(context).showPostModel!.data!.title!}',style:TextStyleManager.textStyle16w500 ,),
                      ),
                      SizedBox(height: 8.h,),
                      PostsCubit.get(context).showPostModel!.data!.image !=''?
                      CachedNetworkImage(imageUrl: PostsCubit.get(context).showPostModel!.data!.image!,fit: BoxFit.fill,width: 390.w,height: 390.h,):
                      const SizedBox(),
                      SizedBox(height: 8.h,),
                      Center(child: Text(PostsCubit.get(context).showPostModel!.data!.description!,style: TextStyleManager.textStyle16w500,)),
                      SizedBox(height: 8.h,),
                    ],
                  ):
                  state is ShowPostsErrorState?
                  Text(state.err):
                  const PostingShimmer(isText: false,);


                },
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h,),
        const ListUserApplied(),


      ],
    );
  }
}
