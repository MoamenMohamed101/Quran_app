import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quran/components.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/surah_model.dart';

class DetailsScreen extends StatelessWidget {
  final int? numberOfSura;

  const DetailsScreen(this.numberOfSura, {super.key});

  Future<Surah> getDetails() async {
    var data = await Dio().get('https://equran.id/api/surat/$numberOfSura');
    return Surah.fromJson(
      json.decode(
        data.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: FutureBuilder<Surah>(
        initialData: null,
        builder: (context, snapshot) => SafeArea(
          child: Text('$numberOfSura'),
        ),
        future: getDetails(),
      ),
    );
  }
}
