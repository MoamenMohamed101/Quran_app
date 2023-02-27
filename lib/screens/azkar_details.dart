import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quran/globals.dart';
import 'package:quran/model/azkar_details_model.dart';

class AzkarDetails extends StatefulWidget {
  int? id;

  AzkarDetails(this.id);

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  List<AzkarDetailsModel> azkarDetails = [];

  void initState() {
    // TODO: implement initState
    loadingItemsDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: primary,
                child: ListTile(
                  title: Text('${azkarDetails[index].reference}',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  subtitle: Text(
                    '${azkarDetails[index].content}',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(),
          itemCount: azkarDetails.length,
        ),
      ),
    );
  }

  void loadingItemsDetails() {
    azkarDetails = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/datas/azkar_details.json')
        .then(
      (value) {
        var response = json.decode(value);
        response.forEach((element) {
          AzkarDetailsModel azkar = AzkarDetailsModel.fromJson(element);
          if (azkar.section_id == widget.id) {
            azkarDetails.add(azkar);
            setState(() {});
          }
        });
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }
}
