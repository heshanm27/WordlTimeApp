import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime{

  String location;
  String flagimg;
  String time;
  String url;
  bool isDayTime;

  worldtime({this.location,this.url,this.flagimg});

  Future<void> getTime() async{
try {
  //get data from api
  Response response = await get(
      Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
  Map data = jsonDecode(response.body);

//asign data for local varibales

  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(0);

//removing ':' this mrk from string
// String off = offset.replaceAll(RegExp(':'), '');

// separate hours and minutes

 String hour = offset.substring(0, 3);
 String min = offset.substring(4, 6);

//convert string to datetime data type
  DateTime now = DateTime.parse(datetime);
  //print(now);
//add hours and minutes to new datetime varibale
  now = now.add(Duration(hours: int.parse(hour),minutes: int.parse(min)));

  isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

  time = DateFormat.jm().format(now);
  //print(time);
}
catch (e) {
  print(" Error Occurd - $e");
  time = "Can't Retrive Data From DataBase Check Your Connection";
}
  }









}