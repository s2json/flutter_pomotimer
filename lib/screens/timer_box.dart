import 'package:flutter/material.dart';

class TimeBox extends StatefulWidget {
  const TimeBox({super.key});

  @override
  State<TimeBox> createState() => _TimeBoxState();
}

class SetTimer {
  late int _minute;
  late int givenTimer;

  SetTimer({givenTimer}) {
    _minute = givenTimer;
  }

  int get() => _minute;

  String get asString => '$_minute';

  set({int givenTimer = 15}) {
    _minute = givenTimer;
  }
}

class _TimeBoxState extends State<TimeBox> {
  bool isSelected = false;
  late final timeToSet = SetTimer();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
          child: Text(
            timeToSet.asString,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Colors.white,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
