import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_player/components/connector.dart';
import 'package:music_player/screens/initialPage.dart';
import '../components/IconsRow.dart';
import '../components/musics.dart';
import 'package:audio_manager/audio_manager.dart';
import 'package:music_player/utilities/constants.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.mMusic, required this.index, this.changeSong,});

  final Songs mMusic;
  late int index;
  late var changeSong;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Duration duration = new Duration();
  Duration position = new Duration();
  IconData pauseAndPlay = Icons.play_arrow;

  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";


  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          pauseAndPlay = Icons.pause;
          //from now we hear song
        });
      }
    }
    //changes the duration to what the user sets
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    //changes the slider position to what the user sets
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  void nextSong(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          pauseAndPlay = Icons.pause;
          //from now we hear song
        });
      }
    }
    //changes the duration to what the user sets
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    //changes the slider position to what the user sets
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }



  @override
  void initState() {
   audioPlayer.onPlayerCompletion.listen((event) {
     setState(() {
       position = Duration(seconds: 0);
       isPlaying = false;
       pauseAndPlay = Icons.play_arrow;
       widget.changeSong(true);
     });
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    IconData favorite = Icons.favorite_outline_rounded;

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
                    style: kTitles,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 150,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(140))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 200,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Slider.adaptive(
                                    activeColor: Color(0xFFF73203),
                                    inactiveColor:
                                        Color(0xFFF73203).withOpacity(0.1),
                                    //change value after 11 step, and add min and max
                                    value: position.inSeconds.toDouble(),
                                    min: 0.0,
                                    max: duration.inSeconds.toDouble(),
                                    onChanged: (value) {
                                      seekToSec(value.toInt());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '${position.inMinutes} : ${position.inSeconds.remainder(60)}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  '${duration.inMinutes} : ${duration.inSeconds.remainder(60)}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                            IconsRow(
                              pauseAndPlay: pauseAndPlay,
                              nextOnPressed: () {
                                setState(() {
                                  widget.changeSong(true);
                                });
                              },
                              pauseOnPressed: () {
                                playMusic(widget.mMusic.url);
                                if(isPlaying)
                                {
                                  audioPlayer.pause();
                                  setState(() {
                                    pauseAndPlay = Icons.play_arrow;
                                    isPlaying = false;
                                  });
                                }else{
                                  audioPlayer.resume();
                                  setState(() {
                                    pauseAndPlay = Icons.pause;
                                    isPlaying = true;
                                  });
                                }
                              },
                              previousOnPressed: () {
                                setState(() {
                                  // audioPlayer.stop();
                                  widget.changeSong(false);

                                });
                              },
                              favoriteOnPressed: () {
                                setState(() {
                                  FavoritesConnector favorite =
                                      FavoritesConnector();
                                  favorite.favorites.add(widget.mMusic);
                                });
                              },
                              favorite: favorite,
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
                              radius: 170,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 165,
                                foregroundImage:
                                    AssetImage(widget.mMusic.image),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//to move to a specific position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }
}
