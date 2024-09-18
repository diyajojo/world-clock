import 'package:flutter/material.dart';
import 'package:worldclock/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

 void setupTime() async {
  WorldTime obj = WorldTime(location: '', flag: '', url: ''); // Assign a default value , if error is caught it still has to be assigend under the navigator
  try {
    obj = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await obj.getTime(); // Wait for getTime() to complete
    setState(() {
      time = obj.time;
    });
  } catch (e) {
    print('Error: $e');
    setState(() {
      time = 'Error: $e';
    });
  }
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location' : obj.location,
    'flag' : obj.flag,
    'time' : obj.time,
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
      backgroundColor: Colors.blue[900],
      body: const Center(
      child :SpinKitFoldingCube(
      color: Colors.white,
      size: 50.0,
       ),
      ),
    );
  }
}