import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DaysPicker extends StatelessWidget {
  int days;

  DaysPicker({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          days.toString(),
          style: TextStyle(
              fontSize: 25,
              color: const Color.fromARGB(255, 5, 5, 5),
              fontFamily: GoogleFonts.rubik().fontFamily),
        ),
      ),
    );
  }
}
