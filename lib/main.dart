import 'package:flutter/material.dart';
import 'package:music_player/screens/astro_music.dart';
import 'components/musics.dart';
import 'screens/initialPage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  Songs list;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialPage(),
    );
  }
}

