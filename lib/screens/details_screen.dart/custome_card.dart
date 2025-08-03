import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomeCard extends StatefulWidget {
  const CustomeCard({super.key});

  @override
  State<CustomeCard> createState() => _CustomeCardState();
}

class _CustomeCardState extends State<CustomeCard> {
  final LiquidController _liquidController = LiquidController();
  int _currentPage = 0;

  final List<Widget> pages = [
    _buildPage("assets/images/image_two_3.png"),
    _buildPage("assets/images/image_two_4.png"),
    _buildPage("assets/images/image_two_5.png"),
    _buildPage("assets/images/image_two_6.png"),
    _buildPage("assets/images/image_two_7.png"),
    _buildPage("assets/images/image_two_8.png"),
    _buildPage("assets/images/image_two_9.png"),
  ];

  static Widget _buildPage(String imagePath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      color: Color.fromARGB(255, 225, 210, 210),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(imagePath, width: 500, height: 400)],
        ),
      ),
    );
  }

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
          'طريقة الوضوء',
          style: GoogleFonts.cairo(
            color: Color.fromARGB(255, 38, 148, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LiquidSwipe(
            pages: pages,
            enableLoop: true,
            fullTransitionValue: 300,
            waveType: WaveType.liquidReveal,
            positionSlideIcon: 0.5,
            slideIconWidget: const Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(255, 38, 148, 91),
              size: 35,
            ),
            liquidController: _liquidController,
            onPageChangeCallback: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            top: 34,
            left: 10,
            bottom: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 38, 148, 91),
                size: 35,
              ),
              onPressed: () {
                if (_currentPage > 0) {
                  _liquidController.jumpToPage(page: _currentPage - 1);
                }
              },
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 20),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color.fromARGB(255, 38, 148, 91),
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
              onDotClicked: (index) {
                _liquidController.jumpToPage(page: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
