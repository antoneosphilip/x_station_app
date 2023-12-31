import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../../../../../view_model/block/posts_cubit/posts_states.dart';
import '../../../../../view_model/block/profile_cubit/profile_cubit.dart';
import '../posting_shimmer/posting_shimmer.dart';
import 'home_top_service_item.dart';

class HomeTopServiceList extends StatelessWidget {
  const HomeTopServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PostsCubit,PostsStates>(
        listener: (context,state){},
        builder: (context,state){
          return state is GetPostsLoadingState?
          const PostingShimmer():
              (PostsCubit.get(context).getPostModel!=null)?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                    child: Text(TextManager.post.tr,style: TextStyleManager.textStyle36w700.copyWith(fontSize: 25.sp,fontWeight: FontWeight.w500,color: ProfileCubit.get(context).isDark?ColorManager.colorWhiteDarkMode:ColorManager.colorBlack,),),
                  ),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return  HomeTopServiceItem(
                          description:PostsCubit.get(context).getPostModel!.data![index].description! ,
                          title:PostsCubit.get(context).getPostModel!.data![index].title!,
                          image: PostsCubit.get(context).getPostModel!.data![index].image!,
                          namePerson: PostsCubit.get(context).getPostModel!.data![index].user!.name!,
                          id: PostsCubit.get(context).getPostModel!.data![index].id!,
                          imagePerson:PostsCubit.get(context).getPostModel!.data![index].user!.avatar! ,
                        );
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(height: 16.h);
                      },
                      itemCount: PostsCubit.get(context).getPostModel!.data!.length,
                  ),
                ],
              ):
              state is GetPostsErrorState?
              Text(state.err):const PostingShimmer();

        }
    );
}
}
