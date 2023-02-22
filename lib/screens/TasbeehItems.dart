import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/components.dart';
import 'package:quran/globals.dart';

class TasbeehItems extends StatelessWidget {
  const TasbeehItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              tasbeehItem('سُبْحَانَ اللَّهِ' , context),
              tasbeehItem('الْحَمْدُ للّهِ', context),
              tasbeehItem('اللَّهُ أَكْبَرُ', context),
              tasbeehItem('لَا إِلَهَ إِلَّا اللَّهُ', context),
              tasbeehItem('رَّبِّ زِدْنِي عِلْمًاً', context),
              tasbeehItem('سُبْحَانَ اللَّهِ وَبِحَمْدِهِ سُبْحَانَ اللَّه الْعَظِيم', context),
              tasbeehItem('اللهم صّلِ وسَلّمْ عَلۓِ نَبِيْنَامُحَمد ﷺ', context),
              tasbeehItem('حَسْبُنَا اللّهُ وَنِعْمَ الْوَكِيلُ', context),
              tasbeehItem('حسبنا الله و نعمة الوكيل', context),
            ],
          ),
        ),
      ),
    );
  }
}
