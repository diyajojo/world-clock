import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  late String location; // location name for UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDay;

  WorldTime({ required this.location, required this.flag, required this.url });


// making http request to api

Future <void> getTime() async{
  Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')); // string is converted to uri object which is expected type of get funciton

  Map data = jsonDecode(res.body); // json to map 
  // print(data);

  // getting properties from data 
   String datetime=data['datetime'];
   String offset=data['utc_offset'].substring(1,3);


   // create DateTime object (pre defined in dart that shows info abt date and time)
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // print(now);

    // set the time property formatted using intl
      
      isDay= now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
}
}