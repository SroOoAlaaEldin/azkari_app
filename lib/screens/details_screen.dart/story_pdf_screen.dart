import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class StoryPdfScreen extends StatelessWidget {
  final String pdfPath;
  const StoryPdfScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 38, 148, 91)),
        title: Text(
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
          "عــرض القصه  ",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 38, 148, 91),
          ),
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Text(pdfPath), // اطبعي المسار عشان تتأكدي
          SfPdfViewer.asset('assets/pdfs/pro_story_1.pdf'),
        ],
      ),
    );
  }
}
