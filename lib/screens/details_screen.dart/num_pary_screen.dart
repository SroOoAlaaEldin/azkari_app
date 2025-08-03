import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumParyScreen extends StatelessWidget {
  const NumParyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.teal),
        centerTitle: true,
        title: Text(
          "عدد الصلوات في اليوم ",
          style: GoogleFonts.cairo(
            color: Color.fromARGB(255, 38, 148, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/image_two_22.png',
              width: 400,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
