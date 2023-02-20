import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';
import 'package:quran/layout/quran_layout.dart';
import 'package:quran/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quran App',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Learn Quran and\nRecite once everyday',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 450,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SvgPicture.asset('assets/svgs/splash.svg'),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -23,
                      child: InkWell(
                       // behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuranLayout(),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}