import 'package:flutter/cupertino.dart';

class MediaQueryUse {
  static double height = 0;
  static double weight = 0;

  static void onInitMq(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    weight = MediaQuery.of(context).size.width;
  }
}
