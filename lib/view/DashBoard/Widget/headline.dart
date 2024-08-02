import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 28,
        // color: const Color.fromARGB(
        //     255, 197, 31, 19), // Set width as per your requirement
        child: Marquee(
          text: '*** Buoy moved out of danger circle, Take action ***',
          style: const TextStyle(
              fontSize: 18, color: Colors.white, backgroundColor: Colors.red),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 450.0,
          velocity: 100.0,
          // pauseAfterRound: Duration(seconds: 1),
          startPadding: 10.0,
          // accelerationDuration: Duration(seconds: 5),
          accelerationCurve: Curves.linear,
          // decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
