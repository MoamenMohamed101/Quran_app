import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/azkar_model.dart';

class AzkarScreen extends StatefulWidget {
  AzkarScreen({Key? key}) : super(key: key);

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<Azkar> azkarr = [];

  @override
  void initState() {
    super.initState();
    loadingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              buildSectionItem(azkarr[index].name),
          itemCount: azkarr.length,
        ),
      ),
    );
  }

  void loadingItems() {
    DefaultAssetBundle.of(context).loadString('assets/datas/azkar.json').then(
      (value) {
        var response = json.decode(value);
        response.forEach((element) {
          Azkar azkar = Azkar.fromJson(element);
          azkarr.add(azkar);
        });
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }
}

buildSectionItem(String? text) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    width: double.infinity,
    height: 100,
    child: Center(
      child: Text(
        '$text',
        // style: TextStyle(
        //     fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        style: GoogleFonts.amiri(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
      ),
    ),
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [
        Colors.purple[200] as Color,
        Colors.purple[700] as Color,
      ], begin: Alignment.topRight, end: Alignment.bottomLeft),
    ),
  );
}
// https://www.youtube.com/watch?v=SDpXiktW-7M&list=PLp2KLZmgpgBT2aEvNn2jlLc_D57mZNxa1&index=1
// https://www.youtube.com/watch?v=bHVremPtgNo&t=468s
