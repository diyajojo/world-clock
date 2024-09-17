import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title :Text( "Choose Location"),
        centerTitle: true,
      ),
    );
  }
}