import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';

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
