import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/components.dart';
import 'package:quran/globals.dart';
import 'package:quran/tabs/para_tab.dart';
import 'package:quran/tabs/surah_tab.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: greeting(),
              ),
              SliverAppBar(
                shape: Border(
                  bottom: BorderSide(
                    color: const Color(0xFFAAAAAA).withOpacity(.1),
                  ),
                ),
                pinned: true,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: background,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: tab(),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                SurahTab(),
                ParaTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
