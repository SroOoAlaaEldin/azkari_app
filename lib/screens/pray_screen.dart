import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayScreen extends StatelessWidget {
  const PrayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 38, 148, 91)),
        title: Text(
          "الــصــلاه",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 38, 148, 91),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _buildCard(
              '/numPray',
              context,
              "عدد الصلوات ",
              "assets/images/image_two_2.png",
              Colors.blueAccent,
            ),
            _buildCard(
              '/testCard',
              context,
              "طريقه الوضــوء الصحيحه ",
              "assets/images/image_two_1.png",
              const Color.fromARGB(255, 89, 211, 87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    String route,
    BuildContext context,
    String nameCard,
    String iconCard,
    Color colorCard,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
      child: Container(
        width: 800,
        height: 800,
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconCard, height: 100),
              //  Icon(iconCard, size: 50, color: Color(0xff4E3D42)),
              const SizedBox(height: 10),
              Text(
                nameCard,

                style: GoogleFonts.cairo(
                  // shadows: [
                  //   Shadow(
                  //     blurRadius: 5.0,
                  //     color: const Color.fromARGB(255, 92, 195, 202),
                  //     offset: Offset(2.0, 2.0),
                  //   ),
                  // ],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 17, 98, 56),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
