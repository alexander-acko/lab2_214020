import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_item.dart';

class JokesScreen extends StatelessWidget {
  final String type;

  JokesScreen({required this.type});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder(
        future: apiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return JokeItem(
                  setup: jokes[index]['setup'],
                  punchline: jokes[index]['punchline'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
