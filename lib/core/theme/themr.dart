import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_manager/color_manager.dart';

abstract class ThemeApp {
  static ThemeData get light => ThemeData(
    // appBarTheme: const AppBarTheme(
    //     backgroundColor: ColorsManager.whiteXXColor, elevation: 0),
    fontFamily: GoogleFonts.aBeeZee().fontFamily,

    scaffoldBackgroundColor: ColorManager.colorWhite,
    primaryColor: ColorManager.colorPrimary,
    // fontFamily: GoogleFonts.barlowCondensed().fontFamily,
  );

}
