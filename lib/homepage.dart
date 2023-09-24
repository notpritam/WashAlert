import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class Machine {
  int id;
  bool vacant;
  String location;
  int secondsRemaining;

  Machine(this.id, this.vacant, this.location, this.secondsRemaining);
}

class ListModel extends ChangeNotifier {
  var list = [
    /* {'number': 1, 'vacant': false, 'location': 'ground', 'timer': const TimerWidget(1)},
    {'number': 2, 'vacant': true, 'location': '5th', 'timer': const TimerWidget(2)},
    {'number': 3, 'vacant': true, 'location': 'ground', 'timer': const TimerWidget(3)},
    {'number': 4, 'vacant': false, 'location': '5th', 'timer': const TimerWidget(4)},
    {'number': 5, 'vacant': false, 'location': 'ground', 'timer': const TimerWidget(5)} */
    Machine(1, true, "ground", 0)
  ];

  var ownlist = [];

  late ListWheelScrollView view;

  void book(int index1, context1) {
    int minutes = 0;
    int seconds = 0;
    showDialog(
      context: context1,
      builder: (context) => Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0, bottom: 60),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: view = ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) {
                            minutes = value;
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) => Text(
                              (index < 10) ? '0$index' : index.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            childCount: 60,
                          ),
                          physics: const FixedExtentScrollPhysics(),
                          perspective: 0.01,
                          diameterRatio: 1.7,
                        ),
                      ),
                      const Text(
                        ':',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (value) {
                            seconds = value;
                          },
                          itemExtent: 50,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (context, index) => Text(
                              (index < 10) ? '0$index' : index.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            childCount: 60,
                          ),
                          physics: const FixedExtentScrollPhysics(),
                          perspective: 0.01,
                          diameterRatio: 1.7,
                        ),
                      ),
                      const Text(
                        'mins',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      ownlist.add(index1);
                      list[index1].vacant = false;
                      list[index1].secondsRemaining = minutes * 60 + seconds;
                      Provider.of<TimerModel>(context1, listen: false)
                          .update(index1, list[index1].secondsRemaining);
                      Timer.periodic(const Duration(seconds: 1), (timer) {
                        if (list[index1].secondsRemaining > 0) {
                          list[index1].secondsRemaining--;
                          Provider.of<TimerModel>(context1, listen: false)
                              .update(index1, list[index1].secondsRemaining);
                        } else {
                          Provider.of<ListModel>(context1, listen: false)
                              .complete(index1);
                          timer.cancel();
                        }
                      });
                      notifyListeners();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Book")),
              ],
            ),
          )),
    );
    notifyListeners();
  }

  void complete(int index) {
    ownlist.remove(index);
    list[index].vacant = true;
    notifyListeners();
  }
}

class CTimer {
  int index;
  String time;

  CTimer(this.index, this.time);
}

class TimerModel extends ChangeNotifier {
  var timers = [CTimer(0, "00:00")];

  String _formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "Time Left: $twoDigitMinutes:$twoDigitSeconds";
  }

  void update(int index, int seconds) {
    timers[index].time = _formatDuration(seconds);
    notifyListeners();
  }
}

/* class TimerWidget extends StatefulWidget {
  final int index;
  const TimerWidget(this.index, {super.key});

  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  @override
  void initState() {
    super.initState();
  }

  int secondsRemaining = 10;
  late Timer timer;

  String _formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    if (secondsRemaining > 0)
      return Text("Time left: ${_formatDuration(secondsRemaining)}");
    else {
      return ElevatedButton(
          onPressed: () {
            Provider.of<ListModel>(context).book(index, context);
          },
          child: const Text("Book"));
    }
  }

  void start(context, int minutes, int seconds) {
    debugPrint("$minutes $seconds");
    secondsRemaining = minutes * 60 + seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        Provider.of<ListModel>(context, listen: false).complete(widget.index);
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
} */

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<ListModel>(context).list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Image(
                      image: AssetImage('assets/washingmachineicon.png'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<ListModel>(
                            builder: (context, value, child) =>
                                Text("Machine ${value.list[index].id}")),
                        const SizedBox(
                          height: 5,
                        ),
                        Consumer<ListModel>(
                            builder: (context, value, child) =>
                                (value.list[index].location == 'ground')
                                    ? const Text("Ground floor")
                                    : const Text("5th Floor")),
                        const SizedBox(
                          height: 5,
                        ),
                        Consumer2<ListModel, TimerModel>(
                            builder: (context, listModel, timerModel, child) =>
                                (listModel.list[index].vacant)
                                    ? ElevatedButton(
                                        onPressed: () {
                                          listModel.book(index, context);
                                        },
                                        child: const Text("Book"))
                                    : Text(timerModel.timers[index].time))
                      ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
