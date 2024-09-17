import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

Map finaldata={};


 @override
  Widget build(BuildContext context) {
     
    //ModalRoute returns an object but its cast to map ,used to fetch arguments passed to navigator in loading.dart
    finaldata=finaldata.isNotEmpty ? finaldata :ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    //print(finaldata);

 // setting background
  

 return Scaffold(
  body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
         image: finaldata['isDay']
            ? AssetImage('assets/day.jpg')
            : AssetImage('assets/night.jpeg'),
          fit: BoxFit.cover,
        ),
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200.0, 0, 0),
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
                          'isDaytime': result['isDay'],
                          'flag': result['flag']
                        };
                      });
                    }
                  },
                icon: Icon(Icons.edit_location),
                label: Text(
                  'Edit Location'
                )
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    finaldata['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                finaldata['time'],
                style: TextStyle(
                  fontSize: 66.0,
                )
              ),
            ],
          ),
        ),
      ),
  ),
    );
  }
}