import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class DigitalClockPage extends StatefulWidget {
  @override
  _DigitalClockPageState createState() => _DigitalClockPageState();
}

class _DigitalClockPageState extends State<DigitalClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Clock'),
      ),
      body: Center(
        child:  DigitalClock(

          hourDigitDecoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.blue, width: 2)),
          minuteDigitDecoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.red, width: 2)),
          secondDigitDecoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(color: Colors.blue),
              shape: BoxShape.circle),
          secondDigitTextStyle: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}