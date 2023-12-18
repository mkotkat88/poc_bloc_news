
import 'package:flutter/material.dart';
import '../../res/colors/base_colors_imp.dart';
import '../../res/dimentions/base_dimension_imp.dart';

class AppStyle {

  TextStyle mainTextStyle =
  TextStyle(fontSize: BaseDimensionImp().defaultText, fontWeight: FontWeight.bold, color: BaseColorsImp().mainTextColor);

  TextStyle subTextStyle =
  TextStyle(fontSize: BaseDimensionImp().mediumText, fontWeight: FontWeight.w600, color: BaseColorsImp().subTextColor);

  TextStyle appbarTextStyle =
  TextStyle(fontSize: BaseDimensionImp().defaultText, fontWeight: FontWeight.w600, color: BaseColorsImp().colorAppbarText);

  TextStyle hyperLinkStyle =
  TextStyle(fontSize: BaseDimensionImp().defaultText, fontWeight: FontWeight.w600, color: BaseColorsImp().hyperLink);

}