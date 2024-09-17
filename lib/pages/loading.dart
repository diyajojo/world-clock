import 'package:flutter/material.dart';
import 'package:worldclock/services/worldtime.dart';

class Loading extends StatefulWidget {
  

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

 void setupTime() async {
  try {
    WorldTime obj = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await obj.getTime(); 
    setState(() {
      time = obj.time;
    });
  } catch (e) {
    print('Error: $e');
    setState(() {
      time = 'Error: $e';
    });
  }
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