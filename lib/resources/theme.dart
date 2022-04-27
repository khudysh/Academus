import 'package:flutter/material.dart';

const _primaryColor = Color(0xFFd62828);

class CustomTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
      primaryColor: _primaryColor,
      backgroundColor: Colors.white,
        highlightColor: Colors.transparent,
        colorScheme: const ColorScheme(
          primary: _primaryColor,
          primaryContainer: Color(0xFF3700B3),
          secondary: Color(0xFFf77f00),
          secondaryContainer: Color(0xFF018786),
          background: Colors.white,
          surface: Colors.white,
          onBackground: Colors.black,
          error: Color(0xFFB00020),
          onError: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          brightness: Brightness.light,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 1,
          color: Color(0xFFE5E5E5),
      )
    );
  }

  static ThemeData get darkTheme {
  return ThemeData(
    primaryColor: const Color.fromARGB(255, 155, 155, 155),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Montserrat',
    textTheme: ThemeData.dark().textTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      buttonColor: const Color.fromARGB(255, 154, 93, 165),
    )
  );
}
}