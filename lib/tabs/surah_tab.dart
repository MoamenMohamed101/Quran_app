import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran/components.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/provider/bookmark_model.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({Key? key}) : super(key: key);

  Future<List<Surah>> getSurahList() async {
    String? data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data);
  }
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Container();
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => surahItem(
               snapshot.data![index], context,bookmarkBloc),
            separatorBuilder: (context, index) => Divider(
              color: const Color(0xFF7B80AD).withOpacity(.35),
            ),
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
}