import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_station_app/view/screens/home/home_widget/posting_shimmer/posting_shimmer.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_cubit.dart';
import 'package:x_station_app/view_model/block/add_faveorite_cubit/add_faveorite_states.dart';

import '../../../../../view_model/block/search_cubit/search_cubit.dart';
import '../../../electrican_details/eletrician_details_widget/electrician_details_item/electrician_details_item.dart';
import '../faveoritelist_item/faveorite_list_item.dart';


class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFavoriteCubit,AddFavoriteStates>(
      listener: (context,state){
      },
      builder: (context,state){
        return state is GetFavoriteLoadingState?const PostingShimmer(isText: false,)
        :
        (AddFavoriteCubit.get(context).addFavoriteModel!=null)?
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return ElectricianDetailsItem(
                name: SearchCubit.get(context).searchModel!.data![index].name!,
                phone: SearchCubit.get(context).searchModel!.data![index].phoneNumber!,
                address: SearchCubit.get(context).searchModel!.data![index].address!,
                price:'50',
                rate: 3,
                email: SearchCubit.get(context).searchModel!.data![index].email!,
                image: SearchCubit.get(context).searchModel!.data![index].avatar!,
                id: SearchCubit.get(context).searchModel!.data![index].id!,
              );
            },
            separatorBuilder: (context,index){
              return SizedBox(height: 25.h);
            },
            itemCount: 10
        ):const PostingShimmer(isText: false,);
      },
    );
  }
}
