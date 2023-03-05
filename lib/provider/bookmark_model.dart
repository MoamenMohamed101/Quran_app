import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:quran/model/ayat.dart';
import 'package:quran/model/surah_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<Ayat> ayat = [];
  List<Surah> surahh = [];

  void addCount() {
    _count++;
    notifyListeners();
  }
  getBookmark() async {
    ayat = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.get('bookmark') as String?;
    if (data != null) {
      var ayat = Ayat.fromJson(json.decode(data));
      addItems(ayat);
    }
    //ayat = ayat.reversed.toList();
    print('data from shared pref: ${data.toString()}');
  }

  void minusCount() {
    _count--;
    notifyListeners();
  }

  void addItems(Ayat data) {
    ayat.add(data);
    notifyListeners();
  }

  void addItemsSurah(Surah data) {
    surahh.add(data);
    notifyListeners();
  }

  int get count {
    return _count;
  }

  List<Ayat> get itemsList {
    return ayat;
  }

  List<Surah> get itemsListSurah {
    return surahh;
  }
}
