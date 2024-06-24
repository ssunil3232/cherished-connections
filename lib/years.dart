import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class YearsPicker extends StatelessWidget {
  int years;

  YearsPicker({super.key, required this.years});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Text(
          years.toString(),
          style: TextStyle(
              fontSize: 25,
              color: const Color.fromARGB(255, 5, 5, 5),
              fontFamily: GoogleFonts.rubik().fontFamily),
        ),
      ),
    );
  }
}
