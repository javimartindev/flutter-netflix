import 'package:flutter/material.dart';
import 'package:flutter_app/components/main_poster.dart';
import 'package:flutter_app/components/rounded_item.dart';
import 'package:flutter_app/components/squared_item.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MainPoster(),
          horizontalList('Trailers', RoundedItem(), 10),
          SizedBox(height: 10.0),
          horizontalList('Trending Now', SquaredItem(), 10),
          SizedBox(height: 10.0),
          horizontalList('Action & Adventure', SquaredItem(), 10),
          SizedBox(height: 10.0),
          horizontalList('My List', SquaredItem(), 10),
          SizedBox(height: 10.0),
        ],
      ),
      bottomNavigationBar: getNavigationBar()
    );
  }
  
  BottomNavigationBar getNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: 'Coming Soon'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_circle_down_rounded),
          label: 'Download'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'More'
        ),
      ],
      selectedLabelStyle: TextStyle(fontSize: 10.0),
      unselectedLabelStyle: TextStyle(fontSize: 10.0),
    );
  }

  Widget horizontalList(String title, Widget item, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            )
          ),
        ),
        Container(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (context, index) {
              return item;
            },
          )
        )
      ]
    );
  }
}