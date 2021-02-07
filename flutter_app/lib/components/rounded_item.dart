import 'package:flutter/material.dart';

class RoundedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: <Widget>[
            Container(
              width: 110.0,
              height: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110.0),
                border: Border.all(
                  color: Colors.yellow,
                  width: 2.0
                )
              ),
              child: ClipOval(
                child: Image.network(
                  'https://www.nme.com/wp-content/uploads/2020/05/dark-netflix-696x442.jpg',
                  fit: BoxFit.cover
                )
              )
            ),
          ],
        ),
        SizedBox(
          width: 10.0
        )
      ],
    );
  }
  
}