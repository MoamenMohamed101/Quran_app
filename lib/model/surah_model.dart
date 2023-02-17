// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

import 'package:quran/model/ayat.dart';

List<Surah> surahFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

String surahToJson(List<Surah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Surah {
  int number;
  String name;
  String latinName;
  int numberofAyat;
  TempatTurun placeGetOff;
  String meaning;
  String description;
  String audio;
  List<Ayat>? ayat;

  Surah(
      {required this.number,
      required this.name,
      required this.latinName,
      required this.numberofAyat,
      required this.placeGetOff,
      required this.meaning,
      required this.description,
      required this.audio,
      required this.ayat});

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
      number: json["nomor"],
      name: json["nama"],
      latinName: json["nama_latin"],
      numberofAyat: json["jumlah_ayat"],
      placeGetOff: tempatTurunValues.map[json["tempat_turun"]]!,
      meaning: json["arti"],
      description: json["deskripsi"],
      audio: json["audio"],
      ayat: json.containsKey('ayat')
          ? List<Ayat>.from(
              json['ayat'].map(
                (x) => Ayat.fromJson(x),
              ),
            )
          : null);

  Map<String, dynamic> toJson() => {
        "nomor": number,
        "nama": name,
        "nama_latin": latinName,
        "jumlah_ayat": numberofAyat,
        "tempat_turun": tempatTurunValues.reverse[placeGetOff],
        "arti": meaning,
        "deskripsi": description,
        "audio": audio,
        'ayat': ayat != null
            ? List<dynamic>.from(
                ayat!.map(
                  (e) => e.toJson(),
                ),
              )
            : []
      };
}

enum TempatTurun { MEKAH, MADINAH }

final tempatTurunValues =
    EnumValues({"madinah": TempatTurun.MADINAH, "mekah": TempatTurun.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
