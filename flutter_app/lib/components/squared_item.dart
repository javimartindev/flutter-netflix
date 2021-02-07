import 'package:flutter/material.dart';

class SquaredItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://pics.filmaffinity.com/Los_favoritos_de_Midas_Miniserie_de_TV-368670725-large.jpg',
          width: 100.0,
          fit: BoxFit.cover
        ),
        SizedBox(width: 10.0)
      ],
    );
  }

}