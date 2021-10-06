import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:music_player/screens/initialPage.dart';

Widget myListView(
    {
  required String title,
required String singer,
required String image,
required onTap,
}){
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(image, fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF0A2E5F),
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                singer,
                style: TextStyle(
                  color: Color(0xFF0A2E5F).withOpacity(0.5),
                  fontSize: 14,
                ),
              )
            ],
          ),
          Spacer(),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5.0,
                    ),
                  ]
              ),
              child: TextButton(
                onPressed: (){},
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.black,
                    size: 42,
                  ),
                ),
              )
          ),
        ],
      ),
    ),
  );
}