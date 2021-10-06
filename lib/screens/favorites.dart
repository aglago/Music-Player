import 'package:flutter/material.dart';
import 'package:music_player/components/connector.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoritesConnector favorites = FavoritesConnector();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFFF73203),
      ),
      body: ListView.builder(
        itemCount: favorites.favorites.length,
        itemBuilder: (context, index) => Container(
          color: Colors.grey[300],
          child: ListTile(
            title: Text('${favorites.favorites[index]}'),
          ),
        ),
      ),
    );
  }
}
