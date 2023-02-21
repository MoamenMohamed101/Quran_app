import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/globals.dart';
import 'package:quran/shared/cubit/cubit.dart';
import 'package:quran/shared/cubit/states.dart';

class QuranLayout extends StatelessWidget {
  const QuranLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuranCubit(),
      child: BlocConsumer<QuranCubit,QuranStates>(
        builder: (context, states) {
          var cubit = QuranCubit.get(context);
          return Scaffold(
            backgroundColor: background,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: background,
              title: Text(
                cubit.titles[cubit.currentIndex!],
              ),
              elevation: 0.0,
            ),
            bottomNavigationBar: cubit.bottomNavigationBar(),
            body: cubit.screens[cubit.currentIndex!],
          );
        },
        listener: (context, states) {},
      ),
    );
  }
}