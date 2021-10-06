import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_player/components/listviewBuilder.dart';
import 'package:music_player/components/musics.dart';
import 'package:music_player/screens/initialPage.dart';
import 'detailPage.dart';

class AstroMusic extends StatefulWidget {
  var index;
  late var musics;
AstroMusic ({this.musics, this.index});

  @override
  _AstroMusicState createState() => _AstroMusicState();
}

class _AstroMusicState extends State<AstroMusic> {
  @override
  void initState() {
    widget.musics = getList();
    super.initState();
  }

  changeMusic(bool isNext) {
    if (isNext) {
      if (widget.index != widget.musics.length - 1) {
        setState(() {
          widget.index++;
        });
        print(widget.index);
      }
    } else {
      if (widget.index != 0) {
        widget.index--;
        print(widget.index);
      }
    }
  }


  List getList() {
    return [
      Songs(
          title: "Uptown Funk",
          singer: "One Republic",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
          image: "assets/AI.jpg"),
      Songs(
        title: "Blank Space",
        singer: "Taylor Swift",
        url:
            "https://ghettoparrot.com/wp-content/uploads/2020/06/Taylor-Swift-Blank-Space.mp3",
        image: "assets/AI.jpg",
      ),
      Songs(
        title: "Shake it off",
        singer: "Coldplay",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
        image: "assets/AI.jpg",
      ),
      Songs(
          title: "Lean On",
          singer: "T. Schürger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Sugar",
          singer: "Adele",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Believer",
          singer: "Ed Sheeran",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Stressed out",
          singer: "Mark Ronson",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Girls Like You",
          singer: "Maroon 5",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Let her go",
          singer: "Passenger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
          image: "assets/AI.jpg"),
      Songs(
          title: "Roar",
          singer: "Katy Perry",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
          image: "assets/AI.jpg"),
    ];
  }

  String avatarImage = 'assets/pic.png';
  String avatarTitle = 'Song title';
  String avatarSinger = 'Singer';
  var playOnPressed = () {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5CB9CC),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF58900), Color(0xFFF73203)])),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 40, bottom: 30, right: 20),
                        child: CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            foregroundImage: AssetImage(
                              avatarImage,
                            ),
                            radius: 78,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            avatarTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            avatarSinger,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.musics.length.toString() + ' Songs',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: playOnPressed,
                                  child: Container(
                                    height: 45,
                                    width: 100,
                                    child: Center(
                                        child: Text(
                                      'Play',
                                      style: TextStyle(
                                          color: Color(0xFF0A2751),
                                          fontWeight: FontWeight.bold),
                                    )),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.favorite_border_rounded,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Colors.white),
                  child: Column(children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      width: 45,
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 255,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: getList().length,
                          itemBuilder: (context, index) => myListView(
                                onTap: () {
                                  setState(() {
                                    avatarImage = widget.musics[index].image;
                                    avatarTitle = widget.musics[index].title;
                                    avatarSinger = widget.musics[index].singer;
                                    playOnPressed = () {
                                      widget.index = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                            mMusic: widget.musics[widget.index],
                                            index: widget.index,
                                            changeSong: changeMusic,
                                          ),
                                        ),
                                      );
                                    };
                                  });
                                },
                                title: widget.musics[index].title,
                                singer: widget.musics[index].singer,
                                image: widget.musics[index].image,
                              )),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
