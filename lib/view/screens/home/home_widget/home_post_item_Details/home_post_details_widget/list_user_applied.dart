import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';

import '../../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../../core/text_manager/text_manager.dart';
import '../../../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../../../../../../view_model/block/posts_cubit/posts_states.dart';

import '../../home_top_services/home_top_service_item.dart';
import '../../posting_shimmer/posting_shimmer.dart';
import 'applied_item.dart';


class ListUserApplied extends StatelessWidget {
  const ListUserApplied({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PostsCubit,PostsStates>(
        listener: (context,state){},
        builder: (context,state){
          return state is ShowPostsLoadingState?const PostingShimmer(isText: false,):
          (PostsCubit.get(context).showPostModel!=null)?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostsCubit.get(context).showPostModel!.data!.allApplied!.isNotEmpty?
              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                child: Text("Applied".tr,style: TextStyleManager.textStyle20w700,),
              ):const SizedBox(),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return  AppliedItem(
                    namePerson: PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.name!,
                    emailPerson: PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.email!,
                    address: PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.address!,
                    phone: PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.phoneNumber!,
                    userId:PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.id!,
                    postId:PostsCubit.get(context).showPostModel!.data!.id!,
                    isJop: PostsCubit.get(context).showPostModel!.data!.jobTaken!,
                    myPost: PostsCubit.get(context).showPostModel!.data!.myPost!,
                    status: PostsCubit.get(context).showPostModel!.data!.allApplied![index].status!,
                    rate: PostsCubit.get(context).showPostModel!.data!.allApplied![index].user!.averageRating!,
                    imagePerson:PostsCubit.get(context).getPostModel!.data![index].user!.avatar! ,
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 8.h);
                },
                itemCount: PostsCubit.get(context).showPostModel!.data!.allApplied!.length,
              ),
            ],
          ):
          state is GetPostsErrorState?
          Text(state.err):const PostingShimmer();

        }
    );
  }
}
