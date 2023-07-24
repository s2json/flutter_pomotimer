import 'package:flutter/material.dart';

class SetTimers extends StatefulWidget {
  const SetTimers({super.key});

  @override
  State<SetTimers> createState() => _SetTimersState();
}

class _SetTimersState extends State<SetTimers> {
  String setTime(int minute) {
    return minute.toString();
  }

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
          padding: const EdgeInsets.all(15),
          child: Text(
            setTime(15),
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
