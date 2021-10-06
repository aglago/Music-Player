import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_player/components/listviewBuilder.dart';
import 'package:music_player/components/musics.dart';
import 'detailPage.dart';

class Chakra extends StatefulWidget {
  const Chakra({Key? key}) : super(key: key);

  @override
  _ChakraState createState() => _ChakraState();
}

class _ChakraState extends State<Chakra> {
  late List musics;
  @override
  void initState() {
    musics = getList();
    super.initState();
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
        "https://img.naijapals.com/69441/n3000311ca56a1cb93397bc676c0b7fff-83f616ad1ce4e7313c38aa86bad03857.mp3",
        image: "assets/AI.jpg",
      ),
      Songs(
        title: "Shake it off",
        singer: "Coldplay",
        url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
        image: "assets/AI.jpg",
      ),
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
                            musics.length.toString() + ' Songs',
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
                                avatarImage = musics[index].image;
                                avatarTitle = musics[index].title;
                                avatarSinger = musics[index].singer;
                                playOnPressed = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            mMusic: musics[index],
                                        index: index,
                                        )),
                                  );
                                };
                              });
                            },
                            title: musics[index].title,
                            singer: musics[index].singer,
                            image: musics[index].image,
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
