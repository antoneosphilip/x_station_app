import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_station_app/view/screens/home/home_widget/home_services/home_Service_shimmer.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_cubit.dart';
import 'package:x_station_app/view_model/block/category_cubit/category_states.dart';

import '../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';
import 'home_services_item.dart';

class HomeServicesWidget extends StatelessWidget {
  const HomeServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CategoryCubit,CategoryStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return state is CategoryLoadingState?const HomeServiceShimmer():
        (CategoryCubit.get(context).categoryModel!=null)?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextManager.category.tr,style: TextStyleManager.textStyle36w700.copyWith(fontSize: 25.sp,fontWeight: FontWeight.w500),),
            SizedBox(height: 8.h,),
            SizedBox(
              height: 140.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return   HomeServicesItem(
                        image: CategoryCubit.get(context).categoryModel!.data![index].image!,
                      name:  CategoryCubit.get(context).categoryModel!.data![index].name!,
                    );
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(width: 16.w,);
                  },
                  itemCount: CategoryCubit.get(context).categoryModel!.data!.length,
              ),
            ),
          ],
        ):
        state is CategoryErrorState?
        Text(state.err.toString()):const HomeServiceShimmer();
      },
    );
  }
}
