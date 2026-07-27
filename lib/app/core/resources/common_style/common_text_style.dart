import 'package:google_fonts/google_fonts.dart';
import '../../utils/resource_const.dart';
import '../app_colors/App_Colors.dart';

class CommonTextStyle {
  static TextStyle titleStyle(double fontSize) => GoogleFonts.nunito(
    color: Colors.white,
    fontSize: fontSize,
    fontWeight: FontWeight.w900,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static TextStyle bodyStyle(double fontSize) => GoogleFonts.nunito(
    color: Colors.white.withOpacity(0.95),
    fontSize: fontSize,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static TextStyle linkStyle(double fontSize) => GoogleFonts.nunito(
    color: AppColors.universalColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );
}