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
        currentIndex: 1,
        onTap: (index) {},
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
    );
  }
}
