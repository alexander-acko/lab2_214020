class Joke {
  final int id;
  final String setup;
  final String punchline;

  Joke(this.id, this.setup, this.punchline);

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(json['id'], json['setup'], json['punchline']);
  }
}
