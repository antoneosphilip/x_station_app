import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/view/core_widget/custom_circle_loading/custom_circle_loading.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import '../../../../../view_model/block/posts_cubit/posts_cubit.dart';
import '../../../../../view_model/block/posts_cubit/posts_states.dart';
import '../../../home/home_widget/home_top_services/home_top_service_item.dart';
import '../../../home/home_widget/posting_shimmer/posting_shimmer.dart';
import 'home_top_service_item.dart';

class HomePostsListTechnican extends StatelessWidget {
  const HomePostsListTechnican({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PostsCubit,PostsStates>(
        listener: (context,state){},
        builder: (context,state){
          return state is GetPostsLoadingState?const PostingShimmer():
          (PostsCubit.get(context).getPostModel!=null)?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 16.w),
                child: Text(TextManager.post,style: TextStyleManager.textStyle36w700.copyWith(fontSize: 30.sp,fontWeight: FontWeight.w500),),
              ),

              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return  HomePostsTechnician(
                    description:PostsCubit.get(context).getPostModel!.data![index].description! ,
                    title:PostsCubit.get(context).getPostModel!.data![index].title!,
                    image: PostsCubit.get(context).getPostModel!.data![index].image! ,
                    namePerson: PostsCubit.get(context).getPostModel!.data![index].user!.name!,
                    id:PostsCubit.get(context).getPostModel!.data![index].user!.id! ,
                    // imagePerson:PostsCubit.get(context).getPostModel!.data![index].user!.avatar! ,
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 8.h);
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
