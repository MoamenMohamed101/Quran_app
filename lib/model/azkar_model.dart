class Azkar {
  int? id;
  String? name;

  Azkar({this.id, this.name});

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      id: json["id"],
      name: json["name"],
    );
  }
}