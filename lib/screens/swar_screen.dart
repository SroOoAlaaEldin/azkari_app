import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:google_fonts/google_fonts.dart';
import 'package:litter_athkar/model/swar_model.dart';

class SwarScreen extends StatefulWidget {
  const SwarScreen({super.key});

  @override
  State<SwarScreen> createState() => _SwarScreenState();
}

class _SwarScreenState extends State<SwarScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  List<SwarModel> surahs = [];
  String? currentPlaying;

  @override
  void initState() {
    super.initState();
    loadSurahs();
  }

  Future<void> loadSurahs() async {
    final String response = await rootBundle.loadString(
      'assets/data/swar.json',
    );
    final List<dynamic> data = json.decode(response);

    setState(() {
      surahs = data.map((e) => SwarModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 38, 148, 91)),
        title: Text(
          "السور القصيرة",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 38, 148, 91),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: surahs.length,
          itemBuilder: (context, index) {
            final surah = surahs[index];
            return ExpansionTile(
              collapsedIconColor: Color.fromARGB(255, 38, 148, 91),
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              title: Text(
                surah.title,
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 29, 115, 71),
                ),
              ),
              children: surah.swar.map((ayah) {
                final playKey = '$index-$ayah';
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 5,
                  ),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 225, 225),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          ayah,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.tajawal(fontSize: 17, height: 1.6),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: Color.fromARGB(255, 38, 148, 91),
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: ayah));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(" ✔تم نسخ الآية")),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () async {
                          if (currentPlaying == playKey) {
                            await audioPlayer.pause();
                            setState(() {
                              currentPlaying = null;
                            });
                          } else {
                            await audioPlayer.pause();
                            await audioPlayer.play(AssetSource(surah.audio));
                            setState(() {
                              currentPlaying = playKey;
                            });
                          }
                        },
                        icon: Icon(
                          currentPlaying == playKey
                              ? Icons.pause
                              : Icons.play_arrow,

                          color: Color.fromARGB(255, 38, 148, 91),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
