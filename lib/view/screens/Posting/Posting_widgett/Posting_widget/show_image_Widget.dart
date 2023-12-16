
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' as io;

import 'package:get/get_core/src/get_main.dart';

class ShowImage extends StatelessWidget {
  ShowImage({super.key,required this.fileImage});
  io.File fileImage;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.file(fileImage),
          Padding(
            padding: const EdgeInsets.only(top: 90,left: 30),
            child: Align(
                alignment: AlignmentDirectional.topStart,
                child: IconButton(icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 40,),
                  onPressed: (){
                    Get.back();
                  },
                )),
          ),

        ],

      ),
    );
  }
}
