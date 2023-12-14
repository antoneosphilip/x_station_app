import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/color_manager/color_manager.dart';
import '../../../../../core/style_font_manager/style_manager.dart';
import '../../../../../core/text_manager/text_manager.dart';

class TechnicalTypes extends StatefulWidget {

  String technicalTypeSelected;
  String technicalExperienceYears;
  final List<String> items;
  final List<String> years;

   TechnicalTypes({super.key, required this.technicalTypeSelected, required this.technicalExperienceYears, required this.items, required this.years});
  @override
  State<TechnicalTypes> createState() => _TechnicalTypesState();

}

class _TechnicalTypesState extends State<TechnicalTypes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<=10;i++){
      widget.years.add(i.toString()+' years');
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
              color: ColorManager.colorGrey.withOpacity(.20),
              border: Border.all(color: ColorManager.colorGrey.withOpacity(.20)),
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint:  Text(
               TextManager.technicalType,
                  style: TextStyleManager.textStyle14w300
              ),
              items: widget.items
                  .map(
                      (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item!,
                        style: TextStyleManager
                            .textStyle14w300
                    ),
                  ))
                  .toList(),
              value: widget.technicalTypeSelected,
              onChanged: (String? value) {
                setState(() {
                  widget.technicalTypeSelected=value!;
                  print(widget.technicalTypeSelected,);
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 10),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,

              ),
            ),
          ),
        ),
        SizedBox(height: 19.h,),
        Container(
          width: double.infinity,
          height: 60.h,
          decoration: BoxDecoration(
              color: ColorManager.colorGrey.withOpacity(.20),
              border: Border.all(color: ColorManager.colorGrey.withOpacity(.20)),
              borderRadius: BorderRadius.circular(10.r)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint:  Text(
                 TextManager.experienceYears,
                  style: TextStyleManager.textStyle14w300
              ),
              items: widget.years
                  .map(
                      (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: TextStyleManager
                            .textStyle14w300
                    ),
                  ))
                  .toList(),
              value:  widget.technicalExperienceYears,
              onChanged: (String? value) {
                setState(() {
                  widget.technicalExperienceYears=value!;
                });
                print(widget.technicalExperienceYears!);
              },

              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 10),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,

              ),
            ),
          ),
        ),

      ],
    );
  }
}
