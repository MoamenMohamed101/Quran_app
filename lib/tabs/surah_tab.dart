import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/screens/details_screen.dart';

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
                surah: snapshot.data!.elementAt(index), context: context),
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

  surahItem({Surah? surah, BuildContext? context}) => InkWell(
        onTap: () => Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(surah.number),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                        child: Text(
                      '${surah!.number}',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.latinName,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          surah.placeGetOff.name,
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: textColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${surah.numberofAyat} Ayat',
                          style: GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                surah.name,
                style: GoogleFonts.amiri(
                    color: primary, fontWeight: FontWeight.w500, fontSize: 20),
              )
            ],
          ),
        ),
      );
}
