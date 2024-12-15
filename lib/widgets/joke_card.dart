import 'dart:math';

import 'package:flutter/material.dart';
import '../screens/joke_screen.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;

  JokeCard({required this.jokeType});

  Color _getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getRandomColor(),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JokesScreen(type: jokeType)),
          );
        },
        child: Center(
           child: Text(
              jokeType,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}
