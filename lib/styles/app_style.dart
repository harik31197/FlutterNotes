import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color mainColor = Color.fromARGB(255, 9, 5, 63);
  static Color accentColor = Color.fromARGB(255, 213, 215, 219);
  static Color bgColor = Color.fromARGB(255, 43, 82, 97);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.niconne(fontSize: 15.0, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.andadaPro(fontSize: 20.0, fontWeight: FontWeight.normal);
}
