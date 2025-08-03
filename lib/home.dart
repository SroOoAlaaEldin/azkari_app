import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 225, 210, 210),
        centerTitle: true,
        title: Text(
          'التحصين',
          style: GoogleFonts.cairo(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 38, 148, 91),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _buildCard(
              '/remb',
              context,
              "الأوراد اليوميه",
              "assets/images/image_two.png",
              Colors.blueAccent,
            ),
            _buildCard(
              '/swar',
              context,
              "الآيــات القصيـره",
              "assets/images/image_one.png",
              const Color.fromARGB(255, 89, 211, 87),
            ),
            _buildCard(
              '/pray',
              context,
              "الصلاه",
              "assets/images/image_four.png",
              Colors.redAccent,
            ),
            _buildCard(
              '/story',
              context,
              "القصص النبويه ",
              "assets/images/image_three.png",
              Colors.teal,
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
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Container(
        width: 500,
        height: 500,
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
                  fontSize: 18,
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
