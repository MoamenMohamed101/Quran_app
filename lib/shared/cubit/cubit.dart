import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/globals.dart';
import 'package:quran/screens/azkar.dart';
import 'package:quran/screens/home_screen.dart';
import 'package:quran/screens/saved_screen.dart';
import 'package:quran/screens/tasbeeh.dart';
import 'package:quran/shared/cubit/states.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranStatesInitial());
  int? currentIndex = 0;
  List screens = [
    HomeScreen(),
    AzkarScreen(),
    TasbeehScreen(),
    SavedScreen(),
  ];
  List<String> titles = [
    'Quran',
    'Azkar',
    'Popular Tasbeeh',
    'Saved Ayat',
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(AppChangeButtonNavBarStates());
  }

  BottomNavigationBar? bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: grey,
        items: [
          bottomNavigationBarItem(icon: 'assets/svgs/quran-icon.svg', text: 'Quran')!,
          bottomNavigationBarItem(icon: 'assets/svgs/doa-icon.svg', text: 'Doa')!,
          bottomNavigationBarItem(icon: 'assets/svgs/lamp-icon.svg', text: 'Tasbeeh')!,
          bottomNavigationBarItem(
              icon: 'assets/svgs/bookmark-icon.svg', text: 'Book Marker')!,
        ],
        elevation: 5.0,
        currentIndex: currentIndex!,
        onTap: (index) {
          changeIndex(index);
        },
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

  static QuranCubit get(context) => BlocProvider.of(context);
}
