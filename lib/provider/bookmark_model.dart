import 'package:flutter/cupertino.dart';
import 'package:quran/model/ayat.dart';
import 'package:quran/model/surah_model.dart';

class BookmarkBloc extends ChangeNotifier {
  int _count = 0;
  List<Ayat> ayat = [];
  List<Surah> surahh = [];

  void addCount() {
    _count++;
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