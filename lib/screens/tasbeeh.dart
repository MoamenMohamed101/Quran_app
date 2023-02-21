import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/globals.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({Key? key}) : super(key: key);

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;

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
            padding: EdgeInsets.all(60.0),
            child: Text(
              'سبحان الله',
              style: GoogleFonts.amiri(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              '$_counter',
              style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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