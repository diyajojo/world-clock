import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map finaldata = {
    'location': 'WORLD CLOCK APP',
    'time': '',
  };

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  body: Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
         image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 300.0, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        finaldata = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                icon: const Icon(
                  Icons.edit_location,
                  color: Colors.white,
                  ),
                label: const Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.white),
                )
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    finaldata['location'].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                finaldata['time'].toUpperCase(),
                style: const TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontFamily: 'SignikaNegative',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
  ),
    );
  }
}