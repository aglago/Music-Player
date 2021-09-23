import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_music_in_background/model/Musics.dart';
import 'components/musics.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({required this.mMusic});
  final Songs mMusic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Duration duration = new Duration();
  Duration position = new Duration();

  //Adding music player
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  String currentSong = "";
  void playMusic(String url) async {
    if (playing && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!playing) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          playing = true;
          pauseAndPlay = Icons.pause;
          //from now we hear song
        });
      }
    }
    //11
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  bool playing = false;
  IconData pauseAndPlay = Icons.play_circle_filled;
void onPressed(){
  if(!playing){

    setState(() {
      pauseAndPlay = Icons.pause_circle_filled_rounded;
      playing = true;
      print('play');
    });
  } else {
    setState(() {
      pauseAndPlay = Icons.play_circle_filled;
      playing = false;
      print('don\'t play');
    });
  }
}
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
                  )
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
                          Slider.adaptive(
                            activeColor: Color(0xFFF73203),
                            inactiveColor: Color(0xFFF73203).withOpacity(0.1),
                            //change value after 11 step, and add min and max
                            value: position.inSeconds.toDouble(),
                            min: 0.0,
                            max: duration.inSeconds.toDouble(),
                            onChanged: (value) {},
                          ),
                          Container(
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
                                // SizedBox(width: 20,),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.fast_rewind,
                                  ),
                                  iconSize: 30,
                                  color: Colors.white,
                                ),
                                // SizedBox(width: 20,),
                                IconButton(
                                  onPressed: () {
                                 print('hello');
                                  },
                                  icon: Icon(
                                    pauseAndPlay,
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
                          )
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

      // body: Container(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.width * 1.15,
      //           child: Stack(
      //             children: [
      //             Center(
      //               child: CircleAvatar(
      //                 radius: 160,
      //                 backgroundColor: Colors.white,
      //                 child: CircleAvatar(
      //                   foregroundImage: AssetImage(widget.mMusic.image),
      //                   radius: 150,
      //                 ),
      //               ),
      //             ),
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 12.0),
      //                 child: SafeArea(
      //                   child: Container(
      //                       decoration: BoxDecoration(
      //                           gradient: LinearGradient(
      //                               begin: Alignment.topLeft,
      //                               end: Alignment.bottomRight,
      //                               colors: [
      //                                 Color(0xFFF58900).withOpacity(0.1),
      //                                 Color(0xFFF73203).withOpacity(0.6)
      //                               ])),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         Container(
      //                           height: 50,
      //                           width: 55,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(10),
      //                             color: Colors.white.withOpacity(0.3)
      //                           ),
      //                           child: IconButton(
      //                             icon: Icon(
      //                               Icons.arrow_back,
      //                               color: Colors.white,
      //                             ), onPressed: () {
      //                               Navigator.pop(context);
      //                           },
      //                           ),
      //                         ),
      //                         //now playing text
      //                         Text(
      //                           'Now Playing',
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontWeight: FontWeight.bold,
      //                               fontSize: 32.0),
      //                         ),
      //                         Text(widget.mMusic.title,
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 32.0)),
      //                         // SizedBox(
      //                         //   height: 6.0,
      //                         // ),
      //                         Text(
      //                           widget.mMusic.singer,
      //                           style: TextStyle(
      //                               color: Colors.white.withOpacity(0.6),
      //                               fontSize: 18.0),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         // SizedBox(
      //         //   height: 42.0,
      //         // ),
      //         Slider.adaptive(
      //           //change value after 11 step, and add min and max
      //           value: position.inSeconds.toDouble(),
      //           min: 0.0,
      //           max: duration.inSeconds.toDouble(),
      //           onChanged: (value) {},
      //         ),
      //         Spacer(),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Icon(
      //               Icons.fast_rewind,
      //               color: Colors.white54,
      //               size: 42.0,
      //             ),
      //             // SizedBox(width: 32.0),
      //             Container(
      //               decoration: BoxDecoration(
      //                   color: iconHoverColor,
      //                   borderRadius: BorderRadius.circular(50.0)),
      //               child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: IconButton(
      //                     onPressed: () {
      //                       playMusic(widget.mMusic.url);
      //                       if (isPlaying) {
      //                         audioPlayer.pause();
      //                         setState(() {
      //                           btnIcon = Icons.play_arrow;
      //                           isPlaying = false;
      //                         });
      //                       } else {
      //                         audioPlayer.resume();
      //                         setState(() {
      //                           btnIcon = Icons.pause;
      //                           isPlaying = true;
      //                         });
      //                       }
      //                     },
      //                     iconSize: 42.0,
      //                     icon: Icon(btnIcon),
      //                     color: Colors.white,
      //                   )),
      //             ),
      //             // SizedBox(width: 32.0),
      //             Icon(
      //               Icons.fast_forward,
      //               color: Colors.white54,
      //               size: 42.0,
      //             ),
      //           ],
      //         ),
      //         Spacer(),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: <Widget>[
      //             Icon(
      //               Icons.bookmark_border,
      //               color: iconHoverColor,
      //             ),
      //             Icon(
      //               Icons.shuffle,
      //               color: iconHoverColor,
      //             ),
      //             Icon(
      //               Icons.repeat,
      //               color: iconHoverColor,
      //             ),
      //           ],
      //         ),
      //         SizedBox(height: 58.0),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
