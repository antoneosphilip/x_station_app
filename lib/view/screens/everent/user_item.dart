import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_ratting_bar/custom_rating_bar.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:162,
      decoration: BoxDecoration(
          color:  const Color.fromRGBO(255, 255, 255, .07),
          borderRadius: BorderRadius.circular(8)
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 8,),
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK?rs=1&pid=ImgDetMain'),
          ),
          SizedBox(height: 8,),
          Text("Esher ",style: TextStyle(fontSize: 16,color: Colors.white),),
          SizedBox(height: 8,),
          CustomRattingBar(),
          SizedBox(height: 8,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16 ),
            child: Text("EveRent is a game-changer for event planning! Highly !",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),),
          )

        ],
      ),
    );
  }
}
