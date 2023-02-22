import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';

class TasbeehScreen extends StatefulWidget {
  var name;

  TasbeehScreen({this.name, Key? key}) : super(key: key);

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState(name);
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;
  var tasbeehName;

  _TasbeehScreenState(this.tasbeehName);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _restart() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
            child: Text(
              tasbeehName,
              textAlign:TextAlign.center  ,
              style: GoogleFonts.poppins(
                fontSize: 45,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 15,
                  onPressed: _incrementCounter,
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.transparent,
                  elevation: 15,
                  onPressed: _restart,
                  child: const Icon(
                    Icons.restart_alt,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 15,
                  onPressed: _decrementCounter,
                  child: const Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// https://github.com/joaopaulozorek/flutter_counter?ref=flutterawesome.com

//Exmple:-
//https://flutterawesome.com/animation-examples-stepper-counter-loading-ripple-circle-generator-water-flow-animation-wave/
