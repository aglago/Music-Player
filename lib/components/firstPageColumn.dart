import 'package:flutter/material.dart';

class Children extends StatelessWidget {
  final String pic;
  final String info;
  final double height;
  final onTap;
  final double bottom;
  Children(
      {required this.info,
      required this.pic,
      required this.height,
      required this.onTap,
      required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: height,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Color(0xFFF58900).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/$pic'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.dstATop))),
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: bottom,
          ),
        ],
      ),
    );
  }
}
