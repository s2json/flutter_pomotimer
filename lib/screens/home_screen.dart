import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/set_timers/set_timers.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 0;
  bool isRunning = false;


  late Timer timer;

  int rounds = 0;
  int totalRounds = 4;
  int goals = 0;
  int totalGoals = 12;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        rounds = rounds + 1;
        isRunning = false;
        totalSeconds = 60 * setMinutes(totalSeconds);
        if (rounds == totalRounds) {
          setState(() {
            totalSeconds = 60 * 5;
          });
          totalSeconds = totalSeconds - 1;
        }
        if (rounds > totalRounds) {
          setState(() {
            rounds = 0;
            goals = goals + 1;
          });
        }
        if (goals > totalGoals) {
          setState(() {
            rounds = 0;
            goals = 0;
          });
        }
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onPausedPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  // Timer minutes
  String formatHours(int seconds) {
    var duration = Duration(seconds: seconds);
    var hours = duration.toString().split(',').first.substring(2, 4);

    return hours;
  }

// Timer seconds
  String formatMinutes(int seconds) {
    var duration = Duration(seconds: seconds);
    var minutes = duration.toString().split(',').first.substring(5, 7);

    return minutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          'POMOTIMER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),

          // Time counter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 20,
                  ),
                  child: Text(
                    formatHours(totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize:
                          Theme.of(context).textTheme.displayLarge?.fontSize,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize:
                          Theme.of(context).textTheme.displayLarge?.fontSize,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 20,
                  ),
                  child: Text(
                    formatMinutes(totalSeconds),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize:
                          Theme.of(context).textTheme.displayLarge?.fontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),

          // Set Timer
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
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
                        setMinutes(15).toString(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.background,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        setMinutes(20).toString(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.background,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        setMinutes(25).toString(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.background,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        setMinutes(30).toString(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.background,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        setMinutes(35).toString(),
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.background
                              : Colors.white,
                          fontSize:
                              Theme.of(context).textTheme.bodyMedium?.fontSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                /*
                const SizedBox(
                  width: 10,
                ),
                MinutesCard(setMinutes: 20),
                SizedBox(
                  width: 10,
                ),
                MinutesCard(setMinutes: 25),
                SizedBox(
                  width: 10,
                ),
                MinutesCard(setMinutes: 30),
                SizedBox(
                  width: 10,
                ),
                MinutesCard(setMinutes: 35),
                */
              ],
            ),
          ),
          const SizedBox(
            height: 90,
          ),

          // Timer player
          IconButton(
            iconSize: 120,
            color: const Color(0xffBF3A2B),
            onPressed: isRunning ? onPausedPressed : onStartPressed,
            icon: Icon(isRunning
                ? Icons.pause_circle_outline_outlined
                : Icons.play_circle_filled_outlined),
          ),
          const SizedBox(
            height: 50,
          ),

          // Round and Goal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$rounds/$totalRounds',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ROUND',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$goals/$totalGoals',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'GOAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
class MinutesCard extends StatelessWidget {
  const MinutesCard({
    super.key,
    required this.setMinutes,
  });
  final bool selected = false;
  final int setMinutes;

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
          color: selected
              ? Colors.white
              : Theme.of(context).colorScheme.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            setMinutes.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
*/