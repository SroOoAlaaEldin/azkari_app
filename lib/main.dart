import 'package:flutter/material.dart';
import 'package:litter_athkar/home.dart';
import 'package:litter_athkar/screens/details_screen.dart/custome_card.dart';
import 'package:litter_athkar/screens/details_screen.dart/num_pary_screen.dart';
import 'package:litter_athkar/screens/details_screen.dart/story_children.dart';
import 'package:litter_athkar/screens/pray_screen.dart';
import 'package:litter_athkar/screens/pro_story_screen.dart';
import 'package:litter_athkar/screens/remb_screen.dart';
import 'package:litter_athkar/screens/swar_screen.dart';
import 'package:litter_athkar/screens/wd_pray_screen.dart';
import 'package:litter_athkar/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home: const Splash(),
      routes: {
        '/home': (context) => Home(),
        '/remb': (context) => RembScreen(),
        '/pray': (context) => PrayScreen(),
        '/story': (context) => ProStoryScreen(),
        '/swar': (context) => SwarScreen(),
        '/wad': (context) => WdPrayScreen(),
        '/testCard': (context) => CustomeCard(),
        '/numPray': (context) => NumParyScreen(),
        '/pray2': (context) => StoryChildren(),
        //'/pray2':(context)=>
      },
    );
  }
}
