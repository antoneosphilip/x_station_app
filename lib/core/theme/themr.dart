import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';

abstract class ThemeApp {
  static ThemeData get light => ThemeData(
    // appBarTheme: const AppBarTheme(
    //     backgroundColor: ColorsManager.whiteXXColor, elevation: 0),
    // fontFamily: GoogleFonts.aBeeZee().fontFamily,

    scaffoldBackgroundColor: ColorManager.colorScaffold,
    primaryColor: ColorManager.colorPrimary,

    // fontFamily: GoogleFonts.barlowCondensed().fontFamily,
  );

  static ThemeData get dark => ThemeData(
    // appBarTheme: const AppBarTheme(
    //     backgroundColor: ColorsManager.whiteXXColor, elevation: 0),
    // fontFamily: GoogleFonts.aBeeZee().fontFamily,

    scaffoldBackgroundColor: ColorManager.colorDark,
    primaryColor: ColorManager.colorPrimary,
    // fontFamily: GoogleFonts.barlowCondensed().fontFamily,
  );
}
