import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran/globals.dart';
import 'package:quran/provider/bookmark_model.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return Scaffold(
      backgroundColor: background,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                            '${bookmarkBloc.ayat[index].nomor}',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      // Text(
                      //   bookmarkBloc.surahh[index].name!,
                      //   style: GoogleFonts.amiri(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 25),
                      // ),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  bookmarkBloc.ayat[index].ar,
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          );
        },
        itemCount: bookmarkBloc.ayat.length,
      ),
    );
  }
}
