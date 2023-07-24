import 'package:flutter/material.dart';

class SetTimer {
  late int _value;

  SetTimer([int setMinute = 15]) {
    _value = setMinute;
  }

  String get asString => "$_value";

  set value(int setMinute) => _value = setMinute;
}

class TimerBox extends StatefulWidget {
  const TimerBox(setMinutes, {super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  bool isSelected = false;

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
            SetTimer(25).toString(),
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
