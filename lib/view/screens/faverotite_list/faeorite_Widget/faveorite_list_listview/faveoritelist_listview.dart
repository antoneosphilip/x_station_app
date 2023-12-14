import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../faveoritelist_item/faveorite_list_item.dart';


class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return const FavoriteItem();
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 25.h);
        },
        itemCount: 10
    );
  }
}
