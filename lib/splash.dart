import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/image_splash.png', height: 250),
            Text(
              'أذكاري',
              style: GoogleFonts.cairo(
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 38, 148, 91),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
