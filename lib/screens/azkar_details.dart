import 'package:flutter/material.dart';

class AzkarDetails extends StatelessWidget {
  int? id;


  AzkarDetails(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$id'),
      ),
    );
  }
}
