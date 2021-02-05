import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/components/main_nav_bar.dart';

class Serie {
  String poster;
  String genre;

  Serie(
    this.poster,
    this.genre);

  factory Serie.fromJson(dynamic json) {
    return Serie(
      json['Poster'] as String,
      json['Genre'] as String);
  }
}

class MainPoster extends StatefulWidget {
  MainPoster({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MainPoster> {
  Future<Serie> serie;
  String imageData;
  bool dataLoaded = false;
  List<String> genre = [];

  @override
  void initState() {
    getSerieByName('lord');
    super.initState();
  }

  void getSerieByName(String serie) async {
    final response = await http.get('https://www.omdbapi.com/?t='+serie+'&apikey=340cfb70');
    setState(() {
      Serie serie = Serie.fromJson(jsonDecode(response.body));
      imageData = serie.poster;
      genre = serie.genre.split(', ');
      dataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this.header(),
        this.subheader()
      ],
    );
  }

  Widget header() {
    if(dataLoaded) {
      return Stack(
        children: [
          Image.network(
            imageData,
            height: 550.0,
            width: double.infinity,
            fit: BoxFit.cover
          ),
          Container(
            width: double.infinity,
            height: 550.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: <Color> [
                  Colors.black38,
                  Colors.black
                ]
              ) 
            ),
          ),
          SafeArea(
            child: MainNavBar()
          ),
        ],
      );
    } else {
      return CircularProgressIndicator(
        backgroundColor: Colors.cyan,
        strokeWidth: 5,
      );
    }
  }

  Widget subheader() {
    if(dataLoaded) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getGenreSerie()
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        ]
      );
    }
  }

  getGenreSerie() {
    if(dataLoaded) {
      List<Widget> listado = [];
      for (int i = 0; i < genre.length; i++) {
        listado.add(
          Text(
            genre[i],
            style: TextStyle(
            color: Colors.white,
            fontSize: 16.0),
          )
        );
        if(i != genre.length - 1) {
          listado.add(
            SizedBox(width: 6.0)
          );
          listado.add(
            Icon(
              Icons.fiber_manual_record, color: Colors.red, size: 5.0
            )
          );
          listado.add(
            SizedBox(width: 6.0)
          );
        }
      }
      return listado;
    } else {
      return <Widget>[];
    }
  }
}