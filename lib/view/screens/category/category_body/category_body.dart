import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/core/assets_manager/assets_manager.dart';
import 'package:x_station_app/core/color_manager/color_manager.dart';
import 'package:x_station_app/core/text_manager/text_manager.dart';
import 'package:x_station_app/model/category_model/category_model.dart';
import 'package:x_station_app/view/core_widget/tab_bar_widget/tab_bar_widget.dart';
import 'package:x_station_app/view/screens/category/category_electrician/category_electrician.dart';
import 'package:x_station_app/view/screens/category/category_shimmer/category_shimer.dart';
import 'package:x_station_app/view/screens/category/category_top_text/category_top_text.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_states.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarWidget(text: TextManager.category,isArrow: false,),
        SizedBox(height: 38.h,),
        Expanded(
          child: BlocConsumer<CategoryCubit,CategoryStates>(
            listener: (context,state){},
            builder: (context,state){
              return state is CategoryLoadingState?const CategoryShimmer():
                  (CategoryCubit.get(context).categoryModel!=null)?
                  GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 190.h,
                          childAspectRatio: .9.h,
                          crossAxisSpacing: .1.w,
                          mainAxisSpacing: 10.h
                      ),
                      itemCount: CategoryCubit.get(context).categoryModel!.data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return  CustomCategoryItem(
                           image: CategoryCubit.get(context).categoryModel!.data![index].image!,
                          name: CategoryCubit.get(context).categoryModel!.data![index].name!,
                          id: CategoryCubit.get(context).categoryModel!.data![index].id!,

                        );
                      }
                  ):
                      state is CategoryErrorState?
                  Text(state.err.toString()):const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}