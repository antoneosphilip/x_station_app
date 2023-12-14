import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../../../core/color_manager/color_manager.dart';

class OpenMapSearchScreen extends StatefulWidget {
  const OpenMapSearchScreen({super.key, required this.callBackFunction});

  final Function callBackFunction;

  @override
  State<OpenMapSearchScreen> createState() => _OpenMapSearchScreenState();
}

class _OpenMapSearchScreenState extends State<OpenMapSearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLat();
  }

  Future getLat() async {
    Geolocator.requestPermission().then((LocationPermission permission) {
      if (permission == LocationPermission.denied) {
        // Handle the case where permission is denied
      } else if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Permission granted, you can now get the current location
        getCurrentLocation();
      }
    });
  }

  double? lat;

  double? lang;

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy:
          LocationAccuracy.high, // You can adjust the desired accuracy
    );
    setState(() {
      lang = position.longitude;
      lat = position.latitude;
    });
    print('Current Location: ${position.latitude}, ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (lang == null || lat == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : OpenStreetMapSearchAndPick(
              center: LatLong(lat ?? 30, lang ?? 30),
              buttonColor: ColorManager.colorPrimary,
              buttonText: 'Set Current Location',
              onPicked: (PickedData pickedData) {
                print(pickedData.latLong.latitude);
                print(pickedData.latLong.longitude);
                print(pickedData.address);
                widget.callBackFunction(pickedData);
              }),
    );
  }
}
