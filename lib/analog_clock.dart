import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  AnalogClockState createState() => AnalogClockState();
}

class AnalogClockState extends State<AnalogClock> {
  double angMinutes = 0.0;
  double angHours = 0.0;
  double angSeconds = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer timer = Timer.periodic(const Duration(microseconds: 500), (timer) {
      final now = DateTime.now();
      setState(() {
        angSeconds = (pi * now.second / 30);
        angMinutes = (pi * now.minute / 30);
        angHours = (pi * now.hour / 6) + (pi * angMinutes) / 45;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('assets/images/clock_face.png'),

              //Dot

              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  alignment: const Alignment(0, 0),
                ),
                angle: angSeconds,
              ),

              //Second hand
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 100,
                    width: 3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  alignment: const Alignment(0, -0.16),
                ),
                angle: angSeconds,
              ),

              //Hour hand
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 72,
                    width: 5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  alignment: const Alignment(0, -0.099),
                ),
                angle: angHours,
              ),

              //Minute hand
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 90,
                    width: 6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  alignment: const Alignment(0, -0.14),
                ),
                angle: angMinutes,
              ),
            ],
          ),
          width: 300,
          alignment: const Alignment(0, 0),
        ),
        alignment: const Alignment(0, 0),
        //color: Colors.redAccent,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ));
  }
}
