// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  int numberOfSeconds = 4;
  Timer? repeatedFunction;
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (numberOfSeconds > 0) {
          numberOfSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (numberOfSeconds > 0)
                  ? numberOfSeconds.toString().padLeft(2, "0")
                  : "🖕",
              style: (numberOfSeconds > 0)
                  ? TextStyle(fontSize: 80, color: Colors.white)
                  : TextStyle(fontSize: 50, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "seconds",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                    if (numberOfSeconds == 0) {
                      setState(() {
                        numberOfSeconds = 4;
                      });
                    }
                  },
                  child: Text(
                    "Start Timer",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 25, 120, 197)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)))),
                ),
                SizedBox(
                  width: 22,
                ),
                ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                  },
                  child: Text(
                    "Stop Timer",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 89, 78)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
