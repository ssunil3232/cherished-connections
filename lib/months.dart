import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MonthsPicker extends StatelessWidget {
  int months;

  MonthsPicker({super.key, required this.months});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          months.toString(),
          style: TextStyle(
              fontSize: 25,
              color: const Color.fromARGB(255, 5, 5, 5),
              fontFamily: GoogleFonts.rubik().fontFamily),
        ),
      ),
    );
  }
}
