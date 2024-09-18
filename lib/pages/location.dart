import 'package:flutter/material.dart';
import 'package:worldclock/services/worldtime.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
    
    List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'newyork.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'bangkok.png'),
    WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'colombo.webp'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.png'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'jerusalem.png'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'qatar.webp'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.webp'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'tokyo.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hongkong.jpg'),
     WorldTime(url: 'Australia/Melbourne', location: 'Melbourne', flag: 'melbourne.png'),
    WorldTime(url: 'Australia/Perth', location: 'Perth', flag: 'perth.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'sydney.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'rome.jpeg'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jamaica.jpg'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico', flag: 'mexico.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'toronto.png'),
    WorldTime(url: 'America/Vancouver', location: 'Vancouver', flag: 'vancouver.png'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin', flag: 'dublin.jpg'),
  ];


  void updateTime(int index) async {
  WorldTime obj =locations[index];
  await obj.getTime(); 

  //navigate back to homescreen we pop it cuz its under locationscreen
   Navigator.pop(context, {
      'location': obj.location,
      'time': obj.time,
      'flag': obj.flag,
  
    });
  } 

  @override
  Widget build(BuildContext context) {
    locations.sort((a, b) => a.location.compareTo(b.location));

      return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
// listTile has an image and text