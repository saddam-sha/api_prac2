class Jokes {
  String? type;
  String? setup;
  String? punchline;
  int? id;

  Jokes({this.type, this.setup, this.punchline, this.id});

  Jokes.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    setup = json["setup"];
    punchline = json["punchline"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["setup"] = setup;
    _data["punchline"] = punchline;
    _data["id"] = id;
    return _data;
  }
}
