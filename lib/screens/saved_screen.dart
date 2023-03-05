import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran/globals.dart';
import 'package:quran/provider/bookmark_model.dart';
import 'package:quran/screens/details_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      var bookmarkBloc = Provider.of<BookmarkBloc>(context, listen: false);
      bookmarkBloc.getBookmark();
    });
  }

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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      numberOfSura: bookmarkBloc.ayat[index].surah,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
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
            ),
          );
        },
        itemCount: bookmarkBloc.ayat.length,
      ),
    );
  }
}
//               child: Dismissible(
//                 key: Key(bookmarkBloc.ayat[index].id.toString()),
//                 onDismissed: (direction) {
//                   bookmarkBloc.ayat.removeAt(index);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         'تم حذف الاية من المفضلة',
//                         style: GoogleFonts.poppins(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         textDirection: TextDirection.rtl,
//                       ),
//                       backgroundColor: primary,
//                     ),
//                   );
//                   bookmarkBloc.minusCount();
//                 },