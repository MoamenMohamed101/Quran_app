import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/ayat.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/screens/details_screen.dart';
import 'package:quran/screens/tasbeehScreen.dart';

// purple container
lastRead() => Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFDF98FA),
                Color(0xFFB070FD),
                Color(0xFF9055FF),
              ],
              stops: [0, .6, 1],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SvgPicture.asset('assets/svgs/quran.svg'),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );

greeting() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'السلام عليكم و رحمة الله و بركاته',
          style: GoogleFonts.aboreto(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        lastRead(),
      ],
    );

tab() => TabBar(
      unselectedLabelColor: textColor,
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
      tabs: const [
        Tab(text: 'surah'),
        // part of 30 parts
        Tab(text: 'para'),
        // Tab(text: 'page'),
        // Tab(text: 'hijab'),
      ],
    );

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach(
        (element) => print(
          element.group(0),
        ),
      );
}

details(Surah surah) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Container(
            height: 257,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFFB070FD),
                  Color(0xFF9055FF),
                ],
                stops: [0, .6, 1],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Opacity(
                opacity: .2,
                child: SvgPicture.asset(
                  'assets/svgs/quran.svg',
                  width: 250,
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  Text(
                    'سورة : ${surah.name}',
                    style: GoogleFonts.amiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // Text(
                  //   surah.meaning,
                  //   style: GoogleFonts.poppins(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  Divider(
                    color: Colors.white.withOpacity(.35),
                    thickness: 2,
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah.placeGetOff.name,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
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
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${surah.numberofAyat} Ayat',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset('assets/svgs/bismillah.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );

ayatItem(Ayat ayat) => Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(27 / 2),
                  ),
                  child: Center(
                    child: Text(
                      '${ayat.nomor}',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.share_outlined,
                  color: primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.play_arrow_outlined,
                  color: primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.bookmark_outline,
                  color: primary,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            ayat.ar,
            style: GoogleFonts.amiri(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          // Text(
          //   ayat.idn,
          //   style: GoogleFonts.poppins(color: textColor, fontSize: 18),
          // ),
        ],
      ),
    );

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
                color: primary,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );

tasbeehItem(text,context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TasbeehScreen(name: text),
              ),
            ),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 7), // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
