import 'package:http/http.dart';
import 'dart:convert';

class worldtime{

  String location;
  String flagimg;
  String time;
  String url;

  worldtime({this.location,this.url,this.flagimg});

  Future<void> getTime() async{

    try{//get data from api
      Response response = await get( Uri.parse('http://worldtimeapi.org/api/timezon/$url'));
      Map data =jsonDecode(response.body);

//asign data for local varibales

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1);

//removing ':' this mrk from string
      String off = offset.replaceAll(RegExp(':'), '');

// separate hours and minutes

      String hour = off.substring(0,2);
      String min = off.substring(2,4);

//convert string to datetime data type
      DateTime now = DateTime.parse(datetime);
//add hours and minutes to new datetime varibale
      now = now.add(Duration(hours: int.parse(hour),minutes: int.parse(min)));
      time = now.toString();
    }

  catch (e){
      print(" Error Occurd $e");
      time = "Can't Retrive Data From DataBase";
  }
  }









}