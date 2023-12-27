import 'package:flutter/material.dart';

import '../electrician_information_widget/electrician_information_widget/electrician_information_widget.dart';

class ElectricianInformationScreen extends StatelessWidget {
  final  String name;
  final  num rate;
  final  String price;
  final  String email;
  final  String phone;
  final  String address;
  final bool isTech;
  final  String image;

  const ElectricianInformationScreen({super.key, required this.name, required this.rate, required this.price, required this.email, required this.phone, required this.address,  this.isTech=true, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ElectricianInformationWidget(
        rate: rate,
        name: name,
        price: price,
        phone: phone,
        email: email,
        address: address,
        isTech: isTech,
        image: image,

      ),
    ));
  }
}
