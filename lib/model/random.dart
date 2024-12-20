class Random {
  String? answer;
  bool? forced;
  String? image;

  Random({this.answer, this.forced, this.image});

  Random.fromJson(Map<String, dynamic> json) {
    answer = json["answer"];
    forced = json["forced"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["answer"] = answer;
    data["forced"] = forced;
    data["image"] = image;
    return data;
  }
}
//https://yesno.wtf/api
