import 'package:flutter/cupertino.dart';
import '../../res/drawable/app_drawable.dart';
import '../../res/style/app_style.dart';
import 'colors/base_colors_imp.dart';
import 'dimentions/base_dimension_imp.dart';
import 'strings/strings.dart';

class Resources {

  final BuildContext _context;
  Resources(this._context);

  Strings? get strings {
    return Localizations.of<Strings>(_context, Strings);
  }

  BaseColorsImp get color {
    return BaseColorsImp();
  }

  BaseDimensionImp get dimension {
    return BaseDimensionImp();
  }

  AppStyle get style {
    return AppStyle();
  }

  AppDrawable get drawable {
    return AppDrawable();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}