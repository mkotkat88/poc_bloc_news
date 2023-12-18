import 'package:flutter/material.dart';
import 'base_colors.dart';

class BaseColorsImp implements BaseColors{
  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(46, 182, 44, 0.1),
    100:const Color.fromRGBO(46, 182, 44, 0.2),
    200:const Color.fromRGBO(46, 182, 44, 0.3),
    300:const Color.fromRGBO(46, 182, 44, 0.4),
    400:const Color.fromRGBO(46, 182, 44, 0.5),
    500:const Color.fromRGBO(46, 182, 44, 0.6),
    600:const Color.fromRGBO(46, 182, 44, 0.7),
    700:const Color.fromRGBO(46, 182, 44, 0.8),
    800:const Color.fromRGBO(46, 182, 44, 0.9),
    900:const Color.fromRGBO(46, 182, 44, 1)
  };


  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFABE098,_primary);

  @override
  Color get mainTextColor => const Color(0xff3893bb);

  @override
  Color get subTextColor => const Color(0xff3b3bbb);

  @override
  Color get colorAppbarText => const Color(0xff4f2b62);

  @override
  Color get hyperLink => const Color(0xff7c06ce);




}