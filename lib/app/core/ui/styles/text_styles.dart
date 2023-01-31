import 'package:flutter/cupertino.dart';

class TextStyles {
  static TextStyles? _instace;
  TextStyles._();
  static TextStyles get i {
    _instace ??= TextStyles._();
    return _instace!;
  }

  String get font => 'mplus';

  TextStyle get textLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: font,
      );
  TextStyle get textRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: font,
      );
  TextStyle get textMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: font,
      );
  TextStyle get textSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: font,
      );
  TextStyle get textBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: font,
      );
  TextStyle get textExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: font,
      );
  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
}

extension TextStles on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
