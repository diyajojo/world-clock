import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            }, // pushes locationpage on top of homepage
            icon: Icon(Icons.edit_location),
            label:Text('Edit the location')
          )
        ]
      )
    );
  }
}