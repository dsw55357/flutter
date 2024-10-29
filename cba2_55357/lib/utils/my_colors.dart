


import 'dart:ui';

class MyColors {
  static final blackColor= HexColor('#0E0E0E'); //('#0E0E0E');

  static final whiteColor = HexColor('#FFFFFF');
  static final purleColor = HexColor('#471FF0');
}



class HexColor extends Color {

  static int _getColorFrameHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if(hexColor.length==6) {
      hexColor = 'FF$hexColor';
    }

    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFrameHex(hexColor));

}