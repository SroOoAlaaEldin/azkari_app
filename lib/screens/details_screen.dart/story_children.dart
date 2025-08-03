import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litter_athkar/model/story_model.dart';
import 'package:litter_athkar/screens/details_screen.dart/story_pdf_screen.dart';

class StoryChildren extends StatefulWidget {
  const StoryChildren({super.key});

  @override
  State<StoryChildren> createState() => _StoryChildrenState();
}

class _StoryChildrenState extends State<StoryChildren> {
  final ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<List<StoryModel>> loadStories() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/stories.json',
    );
    final List jsonList = json.decode(jsonString);
    return jsonList.map((json) => StoryModel.fromJson(json)).toList();
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  late List<StoryModel> stories = [];
  late List<bool> isExpaned;
  @override
  void initState() {
    super.initState();
    loadStories().then((loadedStories) {
      setState(() {
        stories = loadedStories;
      });
      isExpaned = List<bool>.filled(stories.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 38, 148, 91)),
        title: Text(
          "قصص متنـوعـه",
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 38, 148, 91),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 38, 148, 91),
                ),
                onPressed: _scrollLeft,
              ),
              Expanded(
                child: SizedBox(
                  height: 280,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return Flexible(
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/images/image_two_20.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    story.title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    story.desp,
                                    maxLines: isExpaned[index] ? null : 2,
                                    overflow: isExpaned[index]
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isExpaned[index] =
                                                  !isExpaned[index];
                                            });
                                          },
                                          child: Text(
                                            isExpaned[index]
                                                ? "إخفاء"
                                                : "عرض المزيد",
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                38,
                                                148,
                                                91,
                                              ),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton.icon(
                                        icon: const Icon(
                                          Icons.picture_as_pdf,
                                          color: Color.fromARGB(
                                            255,
                                            38,
                                            148,
                                            91,
                                          ),
                                          size: 18,
                                        ),
                                        label: const Text(
                                          "عرض PDF",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                              255,
                                              38,
                                              148,
                                              91,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          print("مسار PDF: ${story.pdf}");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => StoryPdfScreen(
                                                pdfPath: story.pdf,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      // TextButton(
                                      //   onPressed: () {
                                      //     // شاشة تفاصيل مستقبلاً
                                      //   },
                                      //   child: const Text(
                                      //     "عرض المزيد",
                                      //     style: TextStyle(
                                      //       color: Color.fromARGB(
                                      //         255,
                                      //         38,
                                      //         148,
                                      //         91,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 38, 148, 91),
                ),
                onPressed: _scrollRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
