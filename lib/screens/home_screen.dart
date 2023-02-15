import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  BottomNavigationBar? bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: grey,
        items: [
          bottomNavigationBarItem(
              icon: 'assets/svgs/quran-icon.svg', text: 'Quran')!,
          bottomNavigationBarItem(
              icon: 'assets/svgs/lamp-icon.svg', text: 'Tips')!,
          bottomNavigationBarItem(
              icon: 'assets/svgs/pray-icon.svg', text: 'Prayer')!,
          bottomNavigationBarItem(
              icon: 'assets/svgs/doa-icon.svg', text: 'Doa')!,
          bottomNavigationBarItem(
              icon: 'assets/svgs/bookmark-icon.svg', text: 'BookMarker')!,
        ],
        elevation: 5.0,
        currentIndex: 0,
        onTap: (index) {},
        showSelectedLabels: true,
        showUnselectedLabels: false,
      );

  BottomNavigationBarItem? bottomNavigationBarItem(
      {@required String? icon, @required String? text}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon!,
        color: textColor,
      ),
      label: text,
      activeIcon: SvgPicture.asset(
        icon,
        color: primary,
      ),
    );
  }
  lastRead()=>  Stack(
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
  greeting()=> Column(
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
        'Arif Iskander',
        style: GoogleFonts.poppins(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SvgPicture.asset('assets/svgs/menu-icon.svg'),
            const SizedBox(
              width: 24,
            ),
            Text(
              'Quran App',
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
      backgroundColor: background,
      bottomNavigationBar: bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: greeting()
        ),
      ),
    );
  }
}
