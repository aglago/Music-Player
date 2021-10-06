import 'package:flutter/material.dart';
import 'package:music_player/screens/detailPage.dart';

import 'musics.dart';

class IconsRow extends StatefulWidget {
  late final IconData pauseAndPlay;
  late final IconData favorite;
  final pauseOnPressed;
  final previousOnPressed;
  final nextOnPressed;
  final favoriteOnPressed;
  IconsRow({required this.favorite,required this.pauseOnPressed, required this.pauseAndPlay, required this.favoriteOnPressed, required this.nextOnPressed, required this.previousOnPressed});

  @override
  State<IconsRow> createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 250,
      decoration: BoxDecoration(
          color: Color(0xFFF73203),
          borderRadius: BorderRadius.circular(80),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Color(0xFFF73203).withOpacity(0.5),
                offset: Offset(0, 7))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: widget.previousOnPressed,
            icon: Icon(
              Icons.fast_rewind,
            ),
            iconSize: 30,
            color: Colors.white,
          ),
          IconButton(
            onPressed: widget.pauseOnPressed,
            icon: Icon(
              widget.pauseAndPlay,
              size: 30,
              color: Colors.white,
            ),
          ),
          // SizedBox(width: 20,),
          IconButton(
            onPressed: widget.nextOnPressed,
            icon: Icon(
              Icons.fast_forward,
            ),
            iconSize: 30,
            color: Colors.white,
          ),
          // SizedBox(width: 20,),
          IconButton(
            onPressed: widget.favoriteOnPressed,
            icon: Icon(
              widget.favorite,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}