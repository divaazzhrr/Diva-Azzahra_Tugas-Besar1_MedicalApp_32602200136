import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicalapps/features/main_screen.dart';

void main() {
  runApp(medicalapps());
}

class medicalapps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Apps',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1DB954),
          secondary: const Color(0xFF1DB954),
        ),
        fontFamily: 'Roboto',
      ),
      home: MainScreen(),
    );
  }
}