import 'package:flutter/material.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class ListModel extends ChangeNotifier {
  var list = [
    {'number': 1, 'vacant': false, 'location': 'ground'},
    {'number': 2, 'vacant': true, 'location': '5th'},
    {'number': 3, 'vacant': true, 'location': 'ground'},
    {'number': 4, 'vacant': false, 'location': '5th'},
    {'number': 5, 'vacant': false, 'location': 'ground'}
  ];
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  int secondsRemaining = 60;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("Time left: $secondsRemaining");
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ListModel>();

    return ListView.builder(
      itemCount: appState.list.length,
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
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
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
                        Text("Machine ${appState.list[index]['number']}"),
                        SizedBox(
                          height: 5,
                        ),
                        (appState.list[index]['location'] == 'ground')
                            ? Text("Ground floor")
                            : Text("5th Floor"),
                        SizedBox(
                          height: 5,
                        ),
                        (appState.list[index]['vacant'] == true)
                            ? ElevatedButton(
                                onPressed: () {}, child: Text("Book"))
                            : TimerWidget(),
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
