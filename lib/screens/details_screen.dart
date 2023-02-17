import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/components.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/ayat.dart';
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
    return FutureBuilder<Surah>(
      initialData: null,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: background,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        Surah surah = snapshot.data!;
        return Scaffold(
          backgroundColor: background,
          appBar: AppBar(
            backgroundColor: background,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset('assets/svgs/back-icon.svg'),
                ),
                const SizedBox(
                  width: 24,
                ),
                Text(
                  surah.latinName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset('assets/svgs/search-icon.svg'),
              ],
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, headerSliverBuilder) => [
              SliverToBoxAdapter(
                child: details(surah),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ayatItem(
                  snapshot.data!.ayat![index],
                ),
                separatorBuilder: (context, index) => Container(),
                itemCount: surah.ayat!.length,
              ),
            ),
          ),
        );
      },
      future: getDetails(),
    );
  }
}
