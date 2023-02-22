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
          child: Column(
            children: [
              tasbeehItem('سبحان الله' , context),
              tasbeehItem('الحمد الله', context),
              tasbeehItem('الله اكبر', context),
              tasbeehItem('رب زدني علماً', context),
              tasbeehItem('حسبنا الله و نعمة الوكيل', context),
            ],
          ),
        ),
      ),
    );
  }
}
