import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/model/surah_model.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({Key? key}) : super(key: key);

  Future<List<Surah>> getSurahList() async {
    String? data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Container();
        } else {
          return ListView.separated(
            itemBuilder: (context, index) => surahItem(
              surah: snapshot.data!.elementAt(index),
            ),
            separatorBuilder: (context, index) => Container(),
            itemCount: snapshot.data!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: getSurahList(),
    );
  }

  surahItem({Surah? surah}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                SizedBox()
              ],
            )
          ],
        ),
      );
}
