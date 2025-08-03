import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class AzkarDetailScreen extends StatefulWidget {
  final String title;
  final List<String> texts;
  final String image;

  const AzkarDetailScreen({
    super.key,
    required this.title,
    required this.texts,
    required this.image,
  });

  @override
  State<AzkarDetailScreen> createState() => _AzkarDetailScreenState();
}

class _AzkarDetailScreenState extends State<AzkarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final AudioPlayer _player = AudioPlayer();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 38, 148, 91)),
        title: Text(
          widget.title,
          style: GoogleFonts.cairo(
            color: Color.fromARGB(255, 38, 148, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // iconTheme: const IconThemeData(color: Color(0xff4E3D42)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(widget.image, height: 300, width: 300),
          const SizedBox(height: 20),
          ...widget.texts.map(
            (text) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color.fromARGB(255, 233, 206, 206),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.cairo(fontSize: 18, height: 1.6),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("✔ تم نسخ الذكر"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        color: Color.fromARGB(255, 38, 148, 91),
                      ),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () async {
                    //         await _player.play(AssetSource('assets/audios/'));
                    //       },
                    //       icon: const Icon(
                    //         Icons.volume_up,
                    //         color: Color.fromARGB(255, 38, 148, 91),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
