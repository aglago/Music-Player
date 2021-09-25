import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'components/musics.dart';
import 'package:audio_manager/audio_manager.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.mMusic});
  final Songs mMusic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Duration duration = new Duration();
  Duration position = new Duration();

  //Adding music player
  IconData pauseAndPlay = Icons.play_circle_filled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF58900).withOpacity(0.1),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              Color(0xFFF58900).withOpacity(0.5),
              Color(0xFFF73203).withOpacity(0.6)
            ])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //back icon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  //Now playing text
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'Now Playing',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap:(){
                        setState(() {
                          if(pauseAndPlay == Icons.play_circle_filled){
                            pauseAndPlay = Icons.pause_circle_filled_rounded;
                          } else {
                            pauseAndPlay = Icons.play_circle_filled;
                          }
                        });
                      },child: Icon(pauseAndPlay, size: 40,color: Colors.pink,)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: 150,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(140))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 170,
                          ),
                          Text(
                            widget.mMusic.title,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF73203)),
                          ),
                          Text(
                            widget.mMusic.singer,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black.withOpacity(0.3)),
                          ),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  if(pauseAndPlay == Icons.play_circle_filled){
                                    pauseAndPlay = Icons.pause_circle_filled_rounded;
                                  } else {
                                    pauseAndPlay = Icons.play_circle_filled;
                                  }
                                });
                              },child: Icon(pauseAndPlay, size: 40,color: Colors.pink,)),
                          Slider.adaptive(
                            activeColor: Color(0xFFF73203),
                            inactiveColor: Color(0xFFF73203).withOpacity(0.1),
                            //change value after 11 step, and add min and max
                            value: position.inSeconds.toDouble(),
                            min: 0.0,
                            max: duration.inSeconds.toDouble(),
                            onChanged: (value) {},
                          ),
                          IconsRow(pauseAndPlay: pauseAndPlay)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 60,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 150,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 145,
                              foregroundImage: AssetImage(widget.mMusic.image),
                            ),
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconsRow extends StatefulWidget {
  IconsRow({
    Key? key,
    required this.pauseAndPlay,
  }) : super(key: key);

  late IconData pauseAndPlay;

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
            onPressed: () {},
            icon: Icon(
              Icons.fast_rewind,
            ),
            iconSize: 30,
            color: Colors.white,
          ),
         // GestureDetector(
         //   onTap: (){
         //
         //   },
         //   child: Icon(pauseAndPlay, si),
         // ),
          IconButton(
            onPressed: () {
          setState(() {
            if(widget.pauseAndPlay == Icons.play_circle_filled){
              widget.pauseAndPlay = Icons.pause_circle_filled_rounded;
            } else {
              widget.pauseAndPlay = Icons.play_circle_filled;
            }
          });
            },
            icon: Icon(
              widget.pauseAndPlay,
              size: 30,
              color: Colors.white,
            ),
          ),
          // SizedBox(width: 20,),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fast_forward,
            ),
            iconSize: 30,
            color: Colors.white,
          ),
          // SizedBox(width: 20,),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline_rounded,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
