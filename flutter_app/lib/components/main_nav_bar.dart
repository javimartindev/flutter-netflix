import 'package:flutter/material.dart';

class MainNavBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset(
          'assets/imgs/netflix_logo.png',
          width: 30.0,
        ),
        Text(
          'TV Shows',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0),
        ),
        Text(
          'Movies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0),
        ),
        Text(
          'My List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0),
        ),
      ]
    );
  }
}