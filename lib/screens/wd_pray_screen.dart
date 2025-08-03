import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WdPrayScreen extends StatefulWidget {
  const WdPrayScreen({super.key});

  @override
  State<WdPrayScreen> createState() => _WdPrayScreenState();
}

class _WdPrayScreenState extends State<WdPrayScreen> {
  final PageController _controller = PageController(viewportFraction: 0.85);

  final List<String> wuduImages = [
    'assets/images/image_two_3.png',
    'assets/images/image_two_4.png',
    'assets/images/image_two_5.png',
    'assets/images/image_two_6.png',
    'assets/images/image_two_7.png',
    'assets/images/image_two_8.png',
    'assets/images/image_two_9.png',
    'assets/images/image_two_10.png',
    'assets/images/image_two_11.png',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      final page = _controller.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.teal),
        centerTitle: true,
        title: Text(
          'طريقة الوضوء',
          style: GoogleFonts.cairo(
            color: Color.fromARGB(255, 38, 148, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: wuduImages.length,
              itemBuilder: (context, index) {
                final isActive = index == _currentPage;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Align(
                      alignment: Alignment.center,
                      heightFactor: 0.2,
                      child: Image.asset(wuduImages[index], fit: BoxFit.fill)
                          .animate(target: isActive ? 1 : 0)
                          .fade(duration: 200.ms)
                          .scale(duration: 600.ms)
                          .moveY(begin: 30, end: 0, curve: Curves.easeInOut),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: wuduImages.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.teal,
              dotColor: Color.fromARGB(255, 17, 98, 56),
              dotHeight: 7,
              dotWidth: 10,
              spacing: 8,
              expansionFactor: 3,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
