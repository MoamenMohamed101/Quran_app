import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/components.dart';
import 'package:quran/globals.dart';
import 'package:quran/shared/cubit/cubit.dart';
import 'package:quran/shared/cubit/states.dart';
import 'package:quran/tabs/para_tab.dart';
import 'package:quran/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: background,
      //   elevation: 0.0,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     children: [
      //       SvgPicture.asset('assets/svgs/menu-icon.svg'),
      //       const SizedBox(
      //         width: 24,
      //       ),
      //       Text(
      //         'Quran App',
      //         style: GoogleFonts.poppins(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       // const Spacer(),
      //       // SvgPicture.asset('assets/svgs/search-icon.svg'),
      //     ],
      //   ),
      // ),
      backgroundColor: background,
      body: SafeArea(
        child: DefaultTabController(
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
                    // change to bottom
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
                    // change to tab
                    child: tab(),
                  ),
                ),
              ],
              // open comment
              body: TabBarView(
                children: [
                  SurahTab(),
                  ParaTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
