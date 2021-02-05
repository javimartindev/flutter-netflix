import 'package:flutter/material.dart';
import 'package:flutter_app/components/main_poster.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          MainPoster()
        ],
      )
    );
  }
  
}