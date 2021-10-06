import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_player/components/firstPageColumn.dart';
import 'package:music_player/components/musics.dart';
import 'package:music_player/screens/detailPage.dart';
import 'package:music_player/screens/favorites.dart';
import 'package:music_player/screens/brain_massage_music.dart';
import 'package:music_player/screens/whole_brain_optimization_music.dart';
import 'package:music_player/screens/chakra_music.dart';

import 'astro_music.dart';

class InitialPage extends StatefulWidget {


  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var nowPlayingDetails;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Listen Now'),
        backgroundColor: Color(0xFFF73203),
        actions: [IconButton(icon: Icon(Icons.favorite_rounded, size: 30,), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Favorites()));
        },)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Children(
                pic: 'astro.png',
                info: 'Astro Music Therapy',
                height: 20,
                bottom: 0,
                onTap: () async {
                  nowPlayingDetails = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AstroMusic(),
                    ),
                  );
                  print(nowPlayingDetails);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Children(
                pic: 'chakra.png',
                info: 'Chakra Music Therapy',
                height: 20,
                bottom: 0,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Chakra()));
                },
              ),
            ],
          ),
          Row(
            children: [
              Children(
                pic: 'massage.jpg',
                info: 'Brain Massage Therapy',
                height: 20,
                bottom: 0,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BrainMassage()));
                },
              ),
              SizedBox(
                width: 10,
              ),
              Children(
                pic: 'brain.jpg',
                info: 'Whole Brain Optimization Therapy',
                height: 20,
                bottom: 0,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WholeBrainOptimization()));
                },
              ),
            ],
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
