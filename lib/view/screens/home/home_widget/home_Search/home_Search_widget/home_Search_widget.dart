import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_station_app/view_model/block/search_cubit/search_cubit.dart';
import 'package:x_station_app/view_model/block/search_cubit/search_states.dart';

import '../../../../../../core/assets_manager/assets_manager.dart';
import '../../../../../../core/color_manager/color_manager.dart';
import '../../../../../../core/service_locator/service_locator.dart';
import '../../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../../core/text_manager/text_manager.dart';
import '../../../../../../view_model/repo/search_repo/search_repo.dart';
import '../../../../../core_widget/text_form_field/text_form_field_custom.dart';
import '../../../../electrican_details/eletrician_details_widget/electrician_details_item/electrician_details_item.dart';
import '../../../../electrician_information/electrician_information_screen/electrician_information_Screen.dart';
import '../../../../electrician_information/electrician_information_widget/electrician_information_widget/electrician_information_widget.dart';
import '../../posting_shimmer/posting_shimmer.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SearchCubit,SearchStates>(

      listener: (context,state){},
      builder: (context,state){
        return Column(
          children: [
            SizedBox(height: 50.h,),
            TextFormFieldCustom(
              fillColor: Colors.white,
              boarderColor: ColorManager.colorPrimary,
              hint: TextManager.findItHere,
              validate: (value){},
              suffix: true,
              suffixIcon: SvgPicture.asset(AssetsImage.search),
              controller:SearchCubit.get(context).searchController,
              onChanged: (){
                SearchCubit.get(context).getSearch();
              },
              onEditingComplete: (){
                SearchCubit.get(context).getSearch();

              },
              onSaved: (vlaue){
                SearchCubit.get(context).getSearch();

              },
            ),
            SearchCubit.get(context).searchModel!=null?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return state is SearchLoadingState?
                         const PostingShimmer(isText: false,):
                    ElectricianDetailsItem(
                      name: SearchCubit.get(context).searchModel!.data![index].name!,
                      phone: SearchCubit.get(context).searchModel!.data![index].phoneNumber!,
                      address: SearchCubit.get(context).searchModel!.data![index].address!,
                      price:'50',
                      rate: 3,
                      email: SearchCubit.get(context).searchModel!.data![index].email!,
                      image: SearchCubit.get(context).searchModel!.data![index].avatar!,

                    );
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(height: 8.h);
                  },
                  itemCount: SearchCubit.get(context).searchModel!.data!.length,
                ),
              ],
            ):SizedBox()
          ],
        );
      },
    );
  }
}
