import 'package:flutter/cupertino.dart';
import 'package:x_station_app/view/screens/everent/user_item.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          childAspectRatio: .7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,

        ),
        itemCount: 4,
        itemBuilder: (BuildContext ctx, index) {
          return const UserItem();
        }
    );
  }
}
