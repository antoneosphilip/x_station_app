import 'package:flutter/material.dart';

import '../electrician_information_widget/electrician_information_widget/electrician_information_widget.dart';

class ElectricianInformationScreen extends StatelessWidget {
  final  String name;
  final  num rate;
  final  String price;
  final  String email;
  final  String phone;
  final  String address;

  const ElectricianInformationScreen({super.key, required this.name, required this.rate, required this.price, required this.email, required this.phone, required this.address});

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
      ),
    ));
  }
}
