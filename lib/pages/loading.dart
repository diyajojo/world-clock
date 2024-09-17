import 'package:flutter/material.dart';
import 'package:worldclock/services/worldtime.dart';

class Loading extends StatefulWidget {
  

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupTime() async {
  WorldTime obj = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await obj.getTime(obj.url); // Wait for getTime() to complete
  //print(obj.time);
   setState(() {
      time = obj.time;
    });
  }
  


@override
 void initState()
 {
   super.initState();
   setupTime();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}