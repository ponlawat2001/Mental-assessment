import 'package:flutter/material.dart';

class ColorTheme {
  //main Theme
  static Color main30 = const Color(0xFFEDF1D6);
  static Color main20 = const Color(0xFF9DC08B);
  static Color main10 = const Color(0xFF609966);
  static Color main5 = const Color(0xFF40513B);

  //Spacific
  static Color stroke = const Color(0xFFBABABA);
  static Color fieldHint = const Color(0xFF9C9C9C);
  static Color validation = const Color(0xffFF6464);
  static Color deleteMode = const Color(0xffA83D3D);
  static Color editIcon = const Color(0xffFFC786);
  static Color badScore = const Color(0xffFF9264);
  static Color disableField = const Color(0xffD0D0D0);
  static Color greenConfirm = const Color(0xff609966);

  //General
  static Color white = Colors.white;
  static Color lightGray = const Color(0xff636363);
  static Color lightGray2 = const Color(0xff939393);
  static Color dartGray = const Color(0xff636363);
  static Color lightGreen = const Color(0xffE4FDD7);
  //emojicard
  static Color nodataEmoji = const Color(0xffECEDFF);
  static Color sosoEmoji = const Color(0xff88899B);
  static Color badEmoji = const Color(0xffFFE1BE);
  static Color sosoEmojitext = const Color(0xffFFA235);
  static Color worseEmoji = const Color(0xffFF8D8D);
  static Color badEmojitext = const Color(0xff9B7243);
}

ThemeData theme() {
  return ThemeData(
    dividerTheme: const DividerThemeData(color: Colors.white, thickness: 1),

    scrollbarTheme: ScrollbarThemeData(
      thickness: MaterialStateProperty.all(5),
      thumbColor: MaterialStateProperty.all(ColorTheme.main5),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      side: MaterialStateBorderSide.resolveWith(
          (_) => const BorderSide(width: 1, color: Colors.white)),
      fillColor: null,
      checkColor: null,
    ),
    cardColor: Colors.white,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      fillColor: Colors.white,
      errorStyle: const TextStyle(color: Colors.red),
      hintStyle: TextStyle(
          color: ColorTheme.fieldHint,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.red)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: ColorTheme.main10,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // <-- Radius
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    )),

    primaryColor: ColorTheme.main30,
    // primaryColorDark: ColorTheme.ground,
    // primaryColorLight: ColorTheme.primary,
    scaffoldBackgroundColor: ColorTheme.main30,
    radioTheme: RadioThemeData(
        fillColor:
            MaterialStateColor.resolveWith((states) => ColorTheme.lightGray)),
    // fontFamily: 'Readex_Pro',
    // fontFamily: Assets.FONT_PROMPT,
    textTheme: TextTheme(
      displayLarge: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w600, fontSize: 48),
      displayMedium: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w600, fontSize: 36),
      displaySmall: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w600, fontSize: 24),
      headlineMedium: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w600, fontSize: 16),
      headlineSmall: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w500, fontSize: 14),
      titleLarge: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w500, fontSize: 16),
      titleSmall: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w400, fontSize: 12),
      bodyLarge: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w400, fontSize: 14),
      bodyMedium: TextStyle(
          color: ColorTheme.main5, fontWeight: FontWeight.w400, fontSize: 12),
      labelMedium: TextStyle(
          color: ColorTheme.lightGray2,
          fontWeight: FontWeight.w300,
          fontSize: 14),
      bodySmall: TextStyle(
          color: ColorTheme.lightGray2,
          fontWeight: FontWeight.w300,
          fontSize: 12),
    ),
    // colorScheme: ColorScheme(background: ColorTheme.lightGray),
  );
}
