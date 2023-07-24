import 'package:flutter/material.dart';

class SetMinute {
  late int _minute;

  SetMinute([int givenValue = 0]) : _minute = givenValue;

  String get asString => '$_minute';

  set value(int giveValue) => _minute = giveValue;
}

class TimeBox extends StatefulWidget {
  const TimeBox({
    Key? key,
    required this.setTimer,
  }) : super(key: key);

  final SetMinute setTimer;

  @override
  State<TimeBox> createState() => _TimeBoxState();
}

class _TimeBoxState extends State<TimeBox> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    widget.setTimer.value =
        10; // Example: Setting an initial value of 10 minutes
  }

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
            widget.setTimer.asString,
            style: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.background
                  : Colors.white,
              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
